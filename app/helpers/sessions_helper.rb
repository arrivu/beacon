module SessionsHelper


	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

	def store_location
		session[:return_to] = request.url
	end

  def redirect_back_req?
		session[:return_to]
	end

	def redirect_back
		session[:return_to]
	end

	private
		def signed_in_user			
			unless signed_in?
				store_location
				redirect_to new_user_session_path
			end
		end

		def correct_user
			@user = User.find(params[:id])
			redirect_to(root_path) unless current_user?(@user)
		end

		def admin_user?
			current_user.has_role? :admin
		end

end