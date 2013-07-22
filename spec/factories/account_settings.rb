# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :account_setting do
    knowledgepartners false
    mediapartners false
    slideshow false
    popularspeak false
    testimonial false
    accountid "MyString"
  end
end
