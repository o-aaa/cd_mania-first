class RemoveCoverImageIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :cover_image_id, :text
  end
end
