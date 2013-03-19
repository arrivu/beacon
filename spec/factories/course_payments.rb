# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course_payment do
    course_id 1
    price 1.5
    start_date "2013-03-13"
    end_date "2013-03-13"
  end
end
