ActiveMerchant::Billing::Integrations::Ccavenue.setup do |cca|
  cca.merchant_id = "M_blahpache_5678" #your CCAvenue merchant id from the working key generation page
  cca.work_key = "6abc0ty90e0v7jk9hj" #your CCAvenue working key
end
CCAVENUE_ACCOUNT = 'youraccountname'
ActionView::Base.send :include, ActiveMerchant::Billing::Integrations::ActionViewHelper