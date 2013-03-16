# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :teaching_staff_course do
    course_id 1
    teaching_staff_id 1
    teaching_staff_type "MyString"
  end
end
