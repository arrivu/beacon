  class ApplicationController < ActionController::Base
    protect_from_forgery
    include CoursesHelper
    include SessionsHelper    
    include ActiveMerchant::Billing::Integrations::ActionViewHelper
    rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_path, :alert => exception.message
    end
    include TaxRatesHelper

    def after_sign_in_path_for(resource_or_scope)

      if redirect_back_req?
        redirect_back    
      elsif current_user.has_role? :admin
        users_path
      else      
          student=Student.where(user_id: current_user.id).first
          if student!=nil 
            if student.course_enroll.count == 0
              courses_path
            else
              my_courses_path
            end
          end
          #root_path            
      end
    end
  end
