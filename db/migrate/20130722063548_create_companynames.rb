class CreateCompanynames < ActiveRecord::Migration
  def change
    create_table :companynames do |t|
      t.string :string
      t.string :image
      t.string :binary

      t.timestamps
    end
  end
end
