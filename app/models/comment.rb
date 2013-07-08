# == Schema Information
#
# Table name: comments
#

#  id               :integer          not null, primary key
#  commentable_id   :integer          default(0)
#  commentable_type :string(255)      default("")
#  title            :string(255)      default("")
#  body             :text             default("")
#  subject          :string(255)      default("")
#  user_id          :integer          default(0), not null
#  parent_id        :integer
#  lft              :integer
#  rgt              :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null

#  id               :integer         not null, primary key
#  title            :string(50)      default("")
#  comment          :text
#  commentable_id   :integer
#  commentable_type :string(255)
#  user_id          :integer
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

class Comment < ActiveRecord::Base
include ActsAsCommentable::Comment
  attr_accessible :title, :comment
  belongs_to :commentable, :polymorphic => true
  default_scope :order => 'created_at DESC'

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :course , touch: true
  belongs_to :user

  validates :title, presence: true, length: { maximum: 25 }
  validates :comment, presence: true, length: { maximum: 500 }
end
