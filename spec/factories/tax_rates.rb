# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tax_rate do
    valid_from "2013-04-11 10:11:24"
    valid_until "2013-04-11 10:11:24"
    factor "9.99"
    is_default false
  end
end
