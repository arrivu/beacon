# == Schema Information
#
# Table name: blogs
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  author       :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  content      :text
#  ispublished  :integer          default(0)
#  releasemonth :string(255)      default("December")
#  image        :string(255)
#  user_id      :integer
#

class Blog < ActiveRecord::Base
  attr_accessible :title, :author, :image, :content, :tag_ids, :user_id, :ispublished, :releasemonth
  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :user

  #before_save { |course| course.category = category.downcase }

  validates :title, presence: true, length: { maximum: 100 }
  validates :author, presence: true, length: { maximum: 100 }

  default_scope order: 'blogs.created_at DESC'

  def self.search(search)
  	if search
      find(:all, conditions: ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
