module CoursesHelper
	def price_of_course_according_to_date(course)
		if course.course_pricings.empty?
			#raise CoursePriceNotFound
			return 0
		else
			price = course.course_pricings.where("start_date  <=? AND end_date >= ?", Date.today,Date.today)
			if price.empty?
				return 0
				raise CoursePriceNotFound
			else
				price.first.price
			end
		end
	end	
end
