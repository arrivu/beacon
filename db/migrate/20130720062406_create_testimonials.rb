class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :name
      t.string :organization
      t.string :job
      t.string :comment

      t.timestamps
    end
  end
end
