class AddProductIdColumnToOrderitems < ActiveRecord::Migration
  def change
    add_column :orderitems, :product_id, :integer
  end
end
