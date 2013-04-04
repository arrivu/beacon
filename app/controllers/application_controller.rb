class ApplicationController < ActionController::Base
  protect_from_forgery
 include ActiveMerchant::Billing::Integrations::ActionViewHelper
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end



  #def after_sign_in_path_for(resource_or_scope)   
  	# if  params[:course_id] == "0"
  	# 	root_path
   #  else
   #    @course = Course.find(params[:course_id])
   #    new_comment_path(:commentable=>params[:course_id],:commentable_type=>"course")
   #  end    
  #end

end
