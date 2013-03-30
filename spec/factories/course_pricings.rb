# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course_pricing do
    course_id 1
    price 1.5
    start_date "2013-03-29"
    end_date "2013-03-29"
  end
end
