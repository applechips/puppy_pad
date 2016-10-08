class AddGeocodingFieldsToPhotoMaps < ActiveRecord::Migration[5.0]
  def change
    add_column :photo_maps, :address, :string
    add_column :photo_maps, :longitude, :float
    add_column :photo_maps, :latitude, :float
  end
end
