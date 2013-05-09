module PaymentsHelper

def no_admin_user_allow
	if current_user.has_role? :admin
 		redirect_to users_path 
	end
end


end
