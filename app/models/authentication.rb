# == Schema Information
#
# Table name: authentications
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  provider   :string(255)
#  uid        :string(255)
#  token      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Authentication < ActiveRecord::Base
  attr_accessible :provider, :token, :uid, :user_id
  belongs_to :user
end
