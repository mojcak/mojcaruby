class AddSaltColumnToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :salt, :string
  end
end
