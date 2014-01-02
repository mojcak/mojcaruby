class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :customerusername
      t.string :customerpassword
      t.string :customername
      t.string :customersurname
      t.string :customeraddressstreet
      t.string :customeraddressstreetnum
      t.string :customeraddresscity
      t.integer :customerpostnumber
      t.string :customeremail

      t.timestamps
    end

    create_table :customerorders do |t|
      t.belongs_to :customer

      t.string :customerusername
      t.string :customerpassword
      t.string :customername
      t.string :customersurname
      t.string :customeraddressstreet
      t.string :customeraddressstreetnum
      t.string :customeraddresscity
      t.integer :customerpostnumber
      t.string :customeremail

      t.timestamps
    end
  end
end
