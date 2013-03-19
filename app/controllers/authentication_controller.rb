class AuthenticationController < ApplicationController

  include CasHelper


  def create
    auth = request.env["omniauth.auth"]

    # Try to find authentication first
    authentication = Authentication.find_by_provider_and_uid(auth['provider'], auth['uid'])

    if authentication
      # Authentication found, sign the user in.
      flash[:info] = "Welcome. #{authentication.user.name}"
      sign_in_and_redirect(:user, authentication.user)

      #login_and_redirect_user(authentication.user)
    else
      # Authentication not found, thus a new user.
      email=auth['info']['email']
      check_user=User.find_by_email(email)

      if check_user
        flash[:error] = "Email id #{email} Already Registered using #{check_user.provider.capitalize}"
        redirect_to root_url
      else
        user = User.new
        user.apply_omniauth(auth)
        if user.save(:validate => false)
          flash.now[:notice] = "Account created and signed in successfully."
          sign_in_and_redirect(:user, user)
          #login_and_redirect_user(user)
        else
          flash.now[:error] = "Error while creating a user account. Please try again."
          redirect_to root_url
        end
      end
    end
  end


  private

      def login_and_redirect_user(user)
        #first sign-in to cas
        user_cas_sign_in(user)
        # sign-in the user in devise
        sign_in_and_redirect(:user, user)
      end

      def user_cas_sign_in (user)
        tgt = nil
        begin
          tgt = cas_sign_in(user)  if cas_enable?
          # Sets a cookie that expires in 1 hour.
          #cookies[:tgt] = { :value => "#{tgt}", :expires => 1.hour.from_now }
          cookies[:tgt] = tgt
        rescue Exception => e
          puts e.inspect
          puts "There is some error to sing_in to cas using user : #{user.inspect}"
          raise
        end
      end

end

