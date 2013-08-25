class CreateCertifiedProgramUsers < ActiveRecord::Migration
  def change
    create_table :certified_program_users do |t|
      t.string :name
      t.string :email
      t.integer :age
      t.string :city
      t.integer :mobile
      t.string :course

      t.timestamps
    end
  end
end
