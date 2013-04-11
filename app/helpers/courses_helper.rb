module CoursesHelper
	def price_of_course_according_to_date(course)
	  #course.course_pricings.where("start_date >= ? AND end_date <= ?", Date.today).first.price
	end

	def check_admin_user
		authenticate_user!
		if current_user.has_role? :admin
			return
		else
     redirect_to root_url # or whatever
   end
 end

end
