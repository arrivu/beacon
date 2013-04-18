module CoursePricingsHelper
	def nooverlap?(course_ids,start_date,end_date)
		course_ids.each do |course|
			start_date1=Date.parse(course.start_date.to_s)
			end_date1=Date.parse(course.end_date.to_s)
			start_date=Date.parse(start_date.to_s)
			end_date=Date.parse(end_date.to_s)
			return unless((start_date1..end_date1).to_a & (start_date..end_date).to_a).empty?
		end
	end
end



