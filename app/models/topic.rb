# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  desc       :string(255)
#

class Topic < ActiveRecord::Base
  attr_accessible :name, :desc,:id
  #has_many :relationships
  #has_one :courses, through: :relationships
  has_many :courses
   validates :name, presence: true, length: { maximum: 100 }

end
