# == Schema Information
#
# Table name: faqs
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :integer
#  question   :text
#  answer     :text
#

class Faq < ActiveRecord::Base
  attr_accessible :question, :answer, :order_id
  default_scope order: 'faqs.order_id ASC'
end
