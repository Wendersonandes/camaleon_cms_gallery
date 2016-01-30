class CreatePluginsGalleryPhotos < ActiveRecord::Migration
  def change
    create_table :plugins_gallery_photos do |t|
      t.text :title
      t.text :description
      t.string :asset
      t.integer :gallery_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
