class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :contactusername
      t.string :contactemail
      t.string :contactquery

      t.timestamps
    end
  end
end
