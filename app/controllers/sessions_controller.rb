class SessionsController < Devise::SessionsController
  include CasHelper


  
  # POST /resource/sign_in
  def create
    #self.resource = warden.authenticate!(auth_options)
    #set_flash_message(:notice, :signed_in) if is_navigational_format?
    #sign_in(resource_name, resource)


    super
    

    #call cas sign to create the cas ticket
    if current_user 
      user_cas_sign_in( current_user)
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
    cas_sign_out
  end

  private 

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

    def cas_sign_out
      if cas_enable?
        tgt = cookies['tgt']
        begin        
          cas_sign_out_tgt(tgt)
          cookies.delete(:tgt, :domain => cas_cookie_domain)
        rescue  Exception => e
          puts e.inspect
          puts "There is some error to sign_out from cas using user email : #{current_user.email} and tgt : #{tgt}"
        end
      end
    end

end