module CoursesHelper
	def price_of_course_according_to_date(course)
		if course.course_pricings.empty?
			raise CoursePriceNotFound
		else
			price = course.course_pricings.where("start_date  <=? AND end_date >= ?", Date.today,Date.today)
			if price.empty?
				raise CoursePriceNotFound
			else
				price.first.price
			end
		end
	end	
end
