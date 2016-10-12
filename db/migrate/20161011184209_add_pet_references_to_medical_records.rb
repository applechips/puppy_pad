class AddPetReferencesToMedicalRecords < ActiveRecord::Migration[5.0]
  def change
    add_reference :medical_records, :pet, foreign_key: true
  end
end
