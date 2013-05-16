  class ApplicationController < ActionController::Base
    protect_from_forgery
    include ApplicationHelper
    include CoursesHelper
    include SessionsHelper
    include PaymentsHelper    
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
      if student !=nil 
        if student.course_enroll.count == 0
          courses_path
        else
          my_courses_path
        end
      else
        courses_path
      end
    end
  end
 
#   def after_sign_in_path_for(resource)
#     return request.env['omniauth.origin'] || session[:return_to] 
# end

#unless Rails.application.config.consider_all_requests_local
  rescue_from Exception,
              :with => :render_error
  rescue_from ActiveRecord::RecordNotFound,
              :with => :render_not_found
  rescue_from ActionController::RoutingError,
              :with => :render_not_found
  rescue_from ActionController::UnknownController,
              :with => :render_not_found
  rescue_from ActionController::UnknownAction,
              :with => :render_not_found
#end

  def raise_exception
   raise 'This is a test for exception.'
  end

  def render_not_found(exception)
    render :template => "/errors/404.html.erb",
           :layout => 'application.html.erb'
  end
   
  def render_error(exception)
    ExceptionNotifier::Notifier
      .exception_notification(request.env, exception)
      .deliver
      # to use delayed_jobs to deliver the exception emails
      # ExceptionNotifier.notify_exception(exception,
      #    :data => {:worker => worker.to_s, :queue => queue, :payload => payload})
    render :template => "/errors/500.html.erb",
           :layout => 'application.html.erb'
  end
  def routing_error
  render_not_found(nil)
  end
end
