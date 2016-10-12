class AddCoverPhotoColumnToPets < ActiveRecord::Migration[5.0]
  def change
    add_column :pets, :cover_photo, :string
  end
end
