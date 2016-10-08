class AddAddressInfoColumnToVets < ActiveRecord::Migration[5.0]
  def change
    add_column :vets, :postal_code, :string
    add_column :vets, :city, :string
    add_column :vets, :province_state, :string
    add_column :vets, :country, :string
  end
end
