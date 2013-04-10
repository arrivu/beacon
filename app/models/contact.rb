class Contact < ActiveRecord::Base
	attr_accessible :email, :message, :name
	validates :name, presence: true
	validates :message, presence: true  
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
end
