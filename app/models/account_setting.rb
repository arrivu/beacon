class AccountSetting < ActiveRecord::Base
  attr_accessible :accountid, :knowledgepartners, :mediapartners, :popularspeak, :slideshow, :testimonial
end
