# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ActiveRecord::Base
	attr_accessible :name
  has_many :taggings
  has_many :blogs, through: :taggings


  def self.search(search)
  	if search
      find(:all, conditions: ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

end
