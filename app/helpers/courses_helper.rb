module CoursesHelper

	def price_of_course_according_to_date(course)
	  #course.course_pricings.where("start_date >= ? AND end_date <= ?", Date.today).first.price
    end
end
