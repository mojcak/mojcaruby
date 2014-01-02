class AddCustomerordersIdColumnToOrderitems < ActiveRecord::Migration
  def change
    add_column :orderitems, :customerorders_id, :integer
  end
end
