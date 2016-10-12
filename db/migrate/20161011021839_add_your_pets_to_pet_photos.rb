class AddYourPetsToPetPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :pet_photos, :your_pets, :string
  end
end
