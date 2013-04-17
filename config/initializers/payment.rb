ActiveMerchant::Billing::Integrations::Ccavenue.setup do |cca|
  cca.merchant_id = "#{Settings.payment_gateway.merchant_id}" #your CCAvenue merchant id from the working key generation page
  cca.work_key = "#{Settings.payment_gateway.work_key}" #your CCAvenue working key
end
CCAVENUE_ACCOUNT = "#{Settings.payment_gateway.ccavenue_account}"
ActionView::Base.send :include, ActiveMerchant::Billing::Integrations::ActionViewHelper