class ApplicationController < ActionController::Base
  protect_from_forgery
  include CoursesHelper
  include ActiveMerchant::Billing::Integrations::ActionViewHelper
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def after_sign_in_path_for(resource_or_scope)
    if current_user.has_role? :admin
      users_path
    else
      if params[:course_id] == "0"
        student=Student.where(user_id: current_user.id).first
        if student.course_enroll.count == 0
          courses_path
        else
          my_courses_path
        end
        
        #root_path
      else
        @course = Course.find(params[:course_id])
        new_comment_path(:commentable=>params[:course_id],:commentable_type=>"course")
      end
    end
  end
end
