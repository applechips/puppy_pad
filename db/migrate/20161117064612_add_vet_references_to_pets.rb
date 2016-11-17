class AddVetReferencesToPets < ActiveRecord::Migration[5.0]
  def change
    add_reference :pets, :vet, foreign_key: true
  end
end
