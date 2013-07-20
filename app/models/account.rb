class Account < ActiveRecord::Base
  attr_accessible :active, :contactdetails, :name, :noofcourses, :noofusers, :organization
end
