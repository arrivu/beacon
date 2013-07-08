class HomeController < ApplicationController
  def index
		@total_course_count = Course.where(ispublished: 1).all.count
		@countCoursesPerPage = 4
		if params[:mycourses]=="mycourses"
			@courses = Course.where(user_id: current_user.id).paginate(page: params[:page], per_page: 4)
      fresh_when last_modified: @courses.maximum(:updated_at)
		else 
			@courses = Course.where(ispublished: 1).paginate(page: params[:page], per_page: 4)
      fresh_when last_modified: @courses.maximum(:updated_at)
		end
		@topics = Topic.order(:name)
    http_cache(@topics)

	end

end
