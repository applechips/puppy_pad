class AddPetReferencesToVets < ActiveRecord::Migration[5.0]
  def change
    add_reference :vets, :pet, foreign_key: true
  end
end
