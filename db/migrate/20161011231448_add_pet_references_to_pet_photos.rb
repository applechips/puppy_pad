class AddPetReferencesToPetPhotos < ActiveRecord::Migration[5.0]
  def change
    add_reference :pet_photos, :pet, foreign_key: true
  end
end
