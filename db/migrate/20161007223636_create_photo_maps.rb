class CreatePhotoMaps < ActiveRecord::Migration[5.0]
  def change
    create_table :photo_maps do |t|

      t.timestamps
    end
  end
end
