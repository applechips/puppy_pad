class ChangePetPhotoImagesColumn < ActiveRecord::Migration[5.0]
  def change
    # change_column :pet_photos, :images, :string, array:true, default: '{}'
    remove_column :pet_photos, :images, :string
    add_column :pet_photos, :images, :string,  array: true, default: []

  end
end
