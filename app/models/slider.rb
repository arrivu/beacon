class Slider < ActiveRecord::Base
  attr_accessible :account_id, :attachment, :background, :background_image, :body_tag, :header, :image, :image_name, :image_type, :data, :background_image_type
  belongs_to :slider

def attachment=(incoming_file)
     self.image_name = incoming_file.original_filename
    self.image_type = incoming_file.content_type
    self.image = incoming_file.read
    # self.data = incoming_file.read
  end

  def background=(incoming_file)
    self.background_image_type = incoming_file.content_type
    self.background_image = incoming_file.read
  end


  # def image=(new_filename)
  #   write_attribute("image", sanitize_filename(new_filename))
  # end  
end
