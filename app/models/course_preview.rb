class CoursePreview < ActiveRecord::Base

	attr_accessible :desc, :enable, :name, :sequence, :video_url, :course_id,:accountid
	belongs_to :course
	belongs_to :account
	

	validates :name, presence: true, length: { maximum: 50 }
	validates :desc, presence: true, length: { maximum: 100 }
	validates :sequence, presence: true, :numericality => {:only_integer => true},length: { maximum: 3 } 
	validates :course_id, presence: true

	HUMANIZED_ATTRIBUTES = {
		:sequence => "Display Order",
		:desc => "Description",
		:name=> "Title"
	}

	def self.human_attribute_name(attr, options={})
		HUMANIZED_ATTRIBUTES[attr.to_sym] || super
	end
end
