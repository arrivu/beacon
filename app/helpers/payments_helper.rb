module PaymentsHelper

def no_admin_user_allow_to_payment
	if current_user.has_role? :admin
 		redirect_to users_path 
	end
end


end
