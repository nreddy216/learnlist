class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :url
      t.string :description
      t.string :thumbnail_image_url

      t.timestamps null: false
    end
  end
end
