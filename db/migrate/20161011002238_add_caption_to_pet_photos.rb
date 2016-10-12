class AddCaptionToPetPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :pet_photos, :caption, :string
    add_column :pet_photos, :date, :string
  end
end
