class AddGalleryIdToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :gallery_id, :integer
  end
end
