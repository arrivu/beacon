class SessionsController < Devise::SessionsController
  include CasHelper

  # POST /resource/sign_in
  def create
    #self.resource = warden.authenticate!(auth_options)
    #set_flash_message(:notice, :signed_in) if is_navigational_format?
    #sign_in(resource_name, resource)

    super
    #call cas sign to create the cas ticket
    begin
      tgt = nil
      tgt = cas_sign_in(current_user) if  cas_enable?
      cookies[:tgt] = tgt if tgt

    rescue  Exception => e
      puts e.inspect
      puts "There is some error to sing_in to cas using user : #{current_user.inspect}"
      raise
    end

    #respond_with resource, :location => after_sign_in_path_for(resource)
    #self.class.superclass.instance_method(:foo).bind(self).call
  end

  # DELETE /resource/sign_out
  def destroy
    #redirect_path = after_sign_out_path_for(resource_name)
    #signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    #set_flash_message :notice, :signed_out if signed_out && is_navigational_format?
    ## We actually need to hardcode this as Rails default responder doesn't
    ## support returning empty response on GET request
    #respond_to do |format|
    #  format.all { head :no_content }
    #  format.any(*navigational_formats) { redirect_to redirect_path }
    #end

    super
    #cas sign_out
    tgt = cookies['tgt']
    begin
      cas_sign_out_tgt(tgt) if cas_enable?
      cookies.delete :tgt
    rescue  Exception => e
      puts e.inspect
      puts "There is some error to sign_out from cas using user email : #{current_user.email} and tgt : #{tgt}"
    end
  end

end