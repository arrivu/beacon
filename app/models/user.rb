# == Schema Information
#
# Table name: users
#

#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
# 
#  phone                  :string(255)
#  user_type              :string(255)
#  sub_plan               :string(255)
#  user_desc              :string(255)
#  name                   :string(255)
#  username               :string(255)

#

class User < ActiveRecord::Base
  
  include CasHelper
  include LmsHelper

  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and 
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin

  attr_accessible :attachment,:content_type,:image_blob,:lms_id,:name, :email, :password, :password_confirmation, :remember_me, :omni_image_url, :phone,:user_type,:sub_plan,:user_desc, :provider,:subtype, :uid

  has_many :courses, dependent: :destroy
  has_many :o_classes, :class_name => "O_Classe"
  # has_many :tutorials, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :authentication, :dependent => :delete_all

  has_many :comments
  has_one :student
  has_many :invoices

  has_one :teaching_staff , dependent: :destroy 
  accepts_nested_attributes_for :teaching_staff

  # has_one :teaching_staffs, dependent: :destroy
  # has_one :students, dependent: :destroy

  def teachingdetails
   self.teaching_staff_courses.where(:teaching_staff_type => "teacher_assitant")
 end


 letsrate_rater
 def apply_omniauth(auth)
	  # In previous omniauth, 'user_info' was used in place of 'raw_info'
    self.email    = auth['info']['email']
    self.name     = auth['info']['name']
    self.omni_image_url = auth['info']['image']
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

  def attachment=(incoming_file)
    if incoming_file!=nil
      self.content_type = incoming_file.content_type
      self.image_blob = incoming_file.read
    end
  end

  before_destroy:delete_in_lms
  def delete_in_lms
    if lms_enable? 
      lmsuser=CanvasREST::User.new
      lmsuser.set_token(Settings.lms.oauth_token,Settings.lms.api_root_url)
      lmsuser.delete_user(Settings.lms.account_id,self.lms_id)
    end
  end

  def self.insert_user_role(user_id,role_id)
    find_by_sql("insert into users_roles(user_id,role_id) values(#{user_id},#{role_id})")  
  end

def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
  user = User.where(:provider => auth.provider, :uid => auth.uid).first
  unless user
    user = User.create(name:auth.extra.raw_info.name,
                         provider:auth.provider,
                         uid:auth.uid,
                         email:auth.info.email,
                         password:Devise.friendly_token[0,20]
                         )
  end
  user
end
def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
