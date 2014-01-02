class AddCustomerIdColumnToCustomerorders < ActiveRecord::Migration
  def change
    add_column :customerorders, :customer_id, :integer
  end
end
