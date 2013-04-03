module CoursesHelper
	def custom_method
  authenticate_user!

  if current_user.has_role? :admin
   return
 else
     redirect_to root_url # or whatever
   end
 end

end
