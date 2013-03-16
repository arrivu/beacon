# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course_status do
    student_id 1
    course_id 1
    status "MyString"
  end
end
