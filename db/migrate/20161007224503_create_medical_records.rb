class CreateMedicalRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :medical_records do |t|
      t.string :date_month
      t.string :date_day
      t.string :date_year
      t.string :condition_procedure
      t.string :charges
      t.timestamps
    end
  end
end
