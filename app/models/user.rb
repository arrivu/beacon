# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  image                  :binary
#  provider               :string(255)      default("signup")
#  phone                  :string(255)
#  user_type              :string(255)
#  sub_plan               :string(255)
#  user_desc              :string(255)
#  name                   :string(255)
#  username               :string(255)
#

class User < ActiveRecord::Base
  include CasHelper
	rolify
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :image, :phone,:user_type,:sub_plan,:user_desc, :provider
  has_many :courses, dependent: :destroy
  has_many :o_classes, :class_name => "O_Classe"
  has_many :tutorials, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :authentication, :dependent => :delete_all

 
  has_many :comments

  has_one :teaching_staffs, dependent: :destroy
  has_one :students, dependent: :destroy




  letsrate_rater
  def apply_omniauth(auth)
	  # In previous omniauth, 'user_info' was used in place of 'raw_info'
    self.email    = auth['info']['email']
    self.name     = auth['info']['name']
    self.image    = auth['info']['image']
    self.phone    = auth['info']['phone']
    self.provider = auth['provider']

    require 'bcrypt'

    pepper = nil
    cost = 10
    encrypted_password = ::BCrypt::Password.create("#{Time.now.to_s}#{pepper}", :cost => cost).to_s
    self.encrypted_password = encrypted_password

	  # Again, saving token is optional. If you haven't created the column in authentications table, this will fail
	  authentication.build(:provider => auth['provider'], :uid => auth['uid'], :token => auth['credentials']['token'])
	end
end
