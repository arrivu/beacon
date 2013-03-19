class RegistrationsController < Devise::RegistrationsController
  include CasHelper

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

    #LMS User Creation
    lms_enable=parse_boolean "#{Settings.lms.enable}"
    if lms_enable and current_user != nil
      lmsuser=CanvasREST::User.new
      lmsuser.set_token(Settings.lms.oauth_token,Settings.lms.api_root_url)
      u=lmsuser.create_user(Settings.lms.account_id,current_user.name,current_user.email,current_user.password)
      current_user.update_attributes(:lms_id => u["id"])
    end
  end
  
end