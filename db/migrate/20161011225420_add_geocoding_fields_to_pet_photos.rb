class AddGeocodingFieldsToPetPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :pet_photos, :address, :string
    add_column :pet_photos, :longitude, :float
    add_column :pet_photos, :latitude, :float
  end
end
