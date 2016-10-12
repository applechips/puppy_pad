class AddWeightToMedicalRecords < ActiveRecord::Migration[5.0]
  def change
    add_column :medical_records, :weight, :float
    rename_column :medical_records, :date_day, :date
    remove_column :medical_records, :date_month, :string
    remove_column :medical_records, :date_year, :string
  end
end
