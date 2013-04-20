module CoursesHelper
	def price_of_course_according_to_date(course)
		if course.course_pricings.empty?
	  return 0
	else
		price=course.course_pricings.where("start_date  <=? AND end_date >= ?", Date.today,Date.today)
		if price.empty?
			return 0
		else

		price.first.price
	end
	end
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
