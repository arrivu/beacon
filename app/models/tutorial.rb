# == Schema Information
#
# Table name: tutorials
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  author         :string(255)
#  image          :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#  ispublished    :integer          default(0)
#  releasemonth   :string(255)      default("December")
#  desc           :text
#  difficulty     :string(255)
#  estimated_time :integer
#

class Tutorial < ActiveRecord::Base
  attr_accessible :author, :desc, :image, :title, :group_ids, :user_id, :ispublished, :releasemonth, :difficulty, :estimated_time
  has_many :groupings
  has_many :groups, through: :groupings
  belongs_to :user

  #before_save { |course| course.category = category.downcase }

  validates :title, presence: true, length: { maximum: 100 }
  validates :author, presence: true, length: { maximum: 100 }
  validates :desc, presence: true, length: { maximum: 1000 }

  default_scope order: 'tutorials.created_at DESC'
end
