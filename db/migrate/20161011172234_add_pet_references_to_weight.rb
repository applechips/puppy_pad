class AddPetReferencesToWeight < ActiveRecord::Migration[5.0]
  def change
    add_reference :weights, :pet, foreign_key: true
  end
end
