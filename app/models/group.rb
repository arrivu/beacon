# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

<<<<<<< HEAD
# class Group < ActiveRecord::Base
#   attr_accessible :name
#   has_many :groupings
#   has_many :tutorials, through: :groupings
# end
=======
class Group < ActiveRecord::Base
  attr_accessible :name
  has_many :groupings
  has_many :tutorials, through: :groupings

end
>>>>>>> ec25457c563687955038997e42b7636819f2e509
