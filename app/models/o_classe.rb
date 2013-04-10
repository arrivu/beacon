# == Schema Information
#
# Table name: o_classes
#
#  id                      :integer          not null, primary key
#  name                    :string(255)
#  desc                    :string(255)
#  no_of_days              :integer
#  no_of_hours_per_day     :integer
#  start_date              :date
#  end_date                :date
#  start_time_of_day       :time
#  end_time_of_day         :time
#  no_of_student_per_class :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  user_id                 :integer
#

class O_Classe < ActiveRecord::Base
       attr_accessible :desc, :end_date, :end_time_of_day, :name, :no_of_days, :no_of_hours_per_day, :no_of_student_per_class, :start_date, :start_time_of_day

 belongs_to :user

  validates :name, presence: true, length: { maximum: 50 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :end_time_of_day, presence: true
  validates :start_time_of_day, presence: true
  validates :no_of_days, presence: true
  validates :no_of_hours_per_day, presence: true
  validates :no_of_student_per_class, presence: true


  default_scope order: 'O_Classes.created_at DESC'
end
