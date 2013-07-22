class Slider < ActiveRecord::Base
  attr_accessible :accountid, :attachment, :background, :backgroundimage, :bodytag, :header, :image, :imagename, :imagetype, :data, :backgroundimagetype


def attachment=(incoming_file)
     self.imagename = incoming_file.original_filename
    self.imagetype = incoming_file.content_type
    self.image = incoming_file.read
    # self.data = incoming_file.read
  end

  def background=(incoming_file)
    self.backgroundimagetype = incoming_file.content_type
    self.backgroundimage = incoming_file.read
  end


  # def image=(new_filename)
  #   write_attribute("image", sanitize_filename(new_filename))
  # end  
end
