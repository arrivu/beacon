class AddOrderIdToFaq < ActiveRecord::Migration
  def change
    add_column :faqs, :order_id, :integer
  end
end
