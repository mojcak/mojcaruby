class AddProductIdColumnToAlbuminfos < ActiveRecord::Migration
  def change
    add_column :albuminfos, :product_id, :integer
  end
end
