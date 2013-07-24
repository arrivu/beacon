class CoursePricing < ActiveRecord::Base
  attr_accessible :course_id, :end_date, :price, :start_date,:accountid
   belongs_to :course
   validates :course_id, presence:true
   validates :end_date, presence: true
   
   validates :start_date, presence: true
 
   	#validates_format_of :start_date, :with => /\d{2}\/\d{2}\/\d{4}/, :message => "Date must be in the following format: mm/dd/yyyy"
  
   
   	#validates_format_of :end_date, :with => /\d{2}\/\d{2}\/\d{4}/, :message => "Date must be in the following format: mm/dd/yyyy"
   
   validates :price, presence: true, :numericality => true
  
end
