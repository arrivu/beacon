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

	def durationcalculation(course)
		
		   x=(course.end_date-course.start_date).to_i
       if x>30
       	y=x/30
       	z=x%30
       	day=pluralize(z,"day") 
       duration = pluralize(y,"month") 
         return duration
       else
		   y=x/7
		   z=x%7
		   day=pluralize(z,"day") 
       duration = pluralize(y,"week") 
         return duration
		    
		 	end

		    
		end

	



end
