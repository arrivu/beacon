class Preview < ActiveRecord::Base
  attr_accessible :desc, :enable, :name, :sequence, :video_url, :course_id
  belongs_to :course
end
