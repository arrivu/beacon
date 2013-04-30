class RegistrationsController < Devise::RegistrationsController
  include CasHelper
  include LmsHelper
  #after_filter :login_cas, :lms_create, :student_create, :only => [:create]

  def after_sign_up_path_for(resource)
    '/courses'
  end

  def user_image
    @user = User.find(params[:id])
    send_data @user.image_blob, :type => @user.content_type, :disposition => 'inline'
  end

  # POST /resource
  def create
    #build_resource
    #
    #if resource.save
    #  if resource.active_for_authentication?
    #    set_flash_message :notice, :signed_up if is_navigational_format?
    #    sign_up(resource_name, resource)
    #    #call cas sign to create the cas ticket
    #    cas_sign_in(current_user) if  cas_enable?
    #
    #    respond_with resource, :location => after_sign_up_path_for(resource)
    #  else
    #    set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
    #    expire_session_data_after_sign_in!
    #    respond_with resource, :location => after_inactive_sign_up_path_for(resource)
    #  end
    #else
    #  clean_up_passwords resource
    #  respond_with resource
    #end
    super   
    if current_user  
      student_create     
      lms_create
      user_cas_sign_in current_user
    end 
  end

  def update
    @user = User.find(current_user.id)

    successfully_updated = if needs_password?(@user, params)
      @user.update_with_password(params[:user])
    else
      # remove the virtual current_password attribute update_without_password
      # doesn't know how to ignore it
      params[:user].delete(:current_password)
      @user.update_without_password(params[:user])
    end

    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to edit_user_registration_path
    else
      render "edit"
    end
  end

    private

    # def login_cas
    #   #call cas sign to create the cas ticket
    #   if (current_user && cas_enable?)
    #     begin
    #       #cookies[:tgt] = tgt
    #       # Sets a cookie with the domain            
    #       cookies[:tgt] = { :value => "#{tgt}", :domain => cas_cookie_domain }          
    #     rescue Exception => e
    #       puts e.inspect
    #       puts "There is some error to sing_in to cas using user : #{current_user.inspect}"
    #       raise
    #     end
    #   end
    # end

    def user_cas_sign_in (user)
      tgt = nil
      if cas_enable?
        begin
          tgt = cas_sign_in(user)
          #cookies[:tgt] = tgt
          # Sets a cookie with the domain            
          cookies[:tgt] = { :value => "#{tgt}", :domain => cas_cookie_domain }          
        rescue Exception => e
          puts e.inspect
          puts "There is some error to sing_in to cas using user : #{user.inspect}"
          raise
        end
      end
    end   

    def student_create
      if current_user 
        Student.create(:user_id=>current_user.id) 
        current_user.add_role(:student)
      end
    end

    def lms_create
      if (current_user && lms_enable?)
        lms_create_user(current_user)
      end
    end
   
    # check if we need password to update user data
    # ie if password or email was changed
    # extend this as needed
    def needs_password?(user, params)
      user.email != params[:user][:email] ||
      !params[:user][:password].blank?
    end
end
