# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :preview do
    name "MyString"
    desc "MyText"
    video_url "MyString"
    sequence 1
    enable 1
  end
end
