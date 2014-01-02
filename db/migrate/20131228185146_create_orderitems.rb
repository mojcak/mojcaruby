class CreateOrderitems < ActiveRecord::Migration
  def change
    create_table :orderitems do |t|
      t.belongs_to :customerorders
      t.belongs_to :products
      t.integer :orderquantity

      t.timestamps
    end

    create_table :customerorders do |t|
    	t.date :orderdate

      t.timestamps
    end
    create_table :products do |t|
      t.string :productartist
      t.string :productalbum
      t.integer :productprice
      t.string :productpathpicture
      t.string :producttype

      t.timestamps
    end
  end
end
