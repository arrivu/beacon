class CertifiedProgramUser < ActiveRecord::Base
  attr_accessible :age, :city, :course, :email,  :mobile, :name, :upload, :gender, :date_of_birth, :marital_status, 
   :father_name, :father_occupation, :mother_name, :mother_occupation, :Nationality, :mailing_address, 
   :landline, :pg_degree, :pg_discipline, :pg_college, :pg_university, :pg_year, :pg_cpga, :gr_degree, :gr_discipline,
     :gr_college, :gr_university, :gr_year, :gr_cpga, :hsc_degree, :hsc_discipline, 
     :hsc_college, :hsc_university, :hsc_year, :hsc_cpga, :sc_degree, :sc_discipline, :sc_college,
     :sc_university, :sc_year, :sc_cpga, :experience, :ctc, :organization_a, :designation_a, :nature_of_work_a,
     :from_a, :to_a, :organization_b, :designation_b, :nature_of_work_b, :from_b, :to_b, :academic_honor_a,
     :academic_honor_b, :extracuricular_a, :extracuricular_b, :others_a, :others_b, :payment_mode,
     :current_city, :applicant_name
     

     validates :name, presence: true
     validates :gender, presence: true
     validates :date_of_birth, presence: true
     validates :marital_status, presence: true
     validates :father_name, presence: true
     validates :father_occupation, presence: true
     validates :mother_name, presence: true
     validates :mother_occupation, presence: true
     validates :Nationality, presence: true
     validates :mailing_address, presence: true
     validates :mobile, presence: true
     validates :email, presence: true
     validates :gr_degree, presence: true
     validates :gr_discipline, presence: true
     validates :gr_college, presence: true
     validates :gr_university, presence: true
     validates :gr_year, presence: true
     validates :gr_cpga, presence: true
     validates :hsc_degree, presence: true
     validates :hsc_discipline, presence: true
     validates :hsc_college, presence: true
     validates :hsc_university, presence: true
     validates :hsc_year, presence: true
     validates :hsc_cpga, presence: true
     validates :sc_degree, presence: true
     validates :sc_discipline, presence: true
     validates :sc_college, presence: true
     validates :sc_university, presence: true
     validates :sc_year, presence: true
     validates :sc_cpga, presence: true
     validates :current_city, presence: true
     validates :applicant_name, presence: true



      def upload=(incoming_file)
    self.applicant_photo_name = incoming_file.original_filename
    self.applicant_photo_type = incoming_file.content_type
    self.applicant_photo= incoming_file.read
  end
end


