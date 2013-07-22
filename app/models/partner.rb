class Partner < ActiveRecord::Base
  attr_accessible :companyname, :image,:uploaded_file,:filename
  def uploaded_file=(incoming_file)
        self.filename = incoming_file.original_filename
        self.image_type = incoming_file.content_type
        self.image = incoming_file.read
    end

end
