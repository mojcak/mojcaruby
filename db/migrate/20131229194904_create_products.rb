class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :productartist
      t.string :productalbum
      t.integer :productprice
      t.string :productpathpicture
      t.string :producttype

      t.timestamps
    end
    create_table :orderitems do |t|
      t.belongs_to :product
      t.integer :orderquantity

      t.timestamps
    end
    create_table :albuminfos do |t|
      t.belongs_to :product
      t.string :albumsongtitle
        t.string :albumsongpath

        t.timestamps
    end
  end
end
