class RegistrationsController < Devise::RegistrationsController
  include CasHelper
  include LmsHelper

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

    #call cas sign to create the cas ticket
    begin
      tgt = cas_sign_in(current_user) if  cas_enable?
      cookies[:tgt] = tgt if tgt
    rescue Exception => e
      puts e.inspect
      puts "There is some error to sing_in to cas using user : #{current_user.inspect}"
      raise
    end

    lms_create_user(current_user)
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

  # check if we need password to update user data
  # ie if password or email was changed
  # extend this as needed
  def needs_password?(user, params)
    user.email != params[:user][:email] ||
      !params[:user][:password].blank?
  end

end
