class AccountUser < ActiveRecord::Base
attr_accessible :account_id,:user_id ,:membership_type
 belongs_to :account
 belongs_to :user


end
