class AddVetNameColumnToVets < ActiveRecord::Migration[5.0]
  def change
    add_column :vets, :dr_name, :string
  end
end
