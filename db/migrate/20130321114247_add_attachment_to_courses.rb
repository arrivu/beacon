class AddAttachmentToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :content_type, :string
    add_column :courses, :data, :binary
  end
end
