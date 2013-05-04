module PaymentsHelper

def usercheck
	if current_user.has_role? :admin
 		redirect_to users_path 
	end
end


end
