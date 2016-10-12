class CreatePetPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :pet_photos do |t|
      t.string :caption
      t.string :date
      t.string :images

      t.timestamps
    end
  end
end
