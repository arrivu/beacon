class AddProviderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string, default: 'signup'
  end

end
