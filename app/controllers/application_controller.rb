  class ApplicationController < ActionController::Base
    before_filter :load_account
    protect_from_forgery
    include ApplicationHelper
    include CoursesHelper
    include SessionsHelper
    include PaymentsHelper 
    include UrlHelper   
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

  def raise_exception
   raise 'This is a test for exception.'
  end

  def render_not_found(exception)
    render :template => "/errors/404.html.erb",
           :layout => 'application.html.erb'
  end
   
  def render_error(exception)
    render_not_found(nil)
  end
  
  def routing_error
  render_not_found(nil)
  end


   def load_account
      unless current_subdomain.nil?
         @domain_root_account= Account.find_by_name current_subdomain
           if (@domain_root_account == nil)
                redirect_to request.url.sub(current_subdomain, Account.default.name)
            end
          else
            @domain_root_account=Account.default
      end
    end


end
