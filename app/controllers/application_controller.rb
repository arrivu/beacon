class ApplicationController < ActionController::Base
  protect_from_forgery
 include ActiveMerchant::Billing::Integrations::ActionViewHelper
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

 def after_sign_in_path_for(resource)
  
  if (request.referer == '/users/sign_in')
    super
  else
    request.referer
  end
end

end
