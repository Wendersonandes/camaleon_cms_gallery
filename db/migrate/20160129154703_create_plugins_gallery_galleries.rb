class CreatePluginsGalleryGalleries < ActiveRecord::Migration
  def change
    create_table :plugins_gallery_galleries do |t|
      t.text :title
      t.text :description
      t.integer :parent_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
