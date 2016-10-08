class CreateBreeders < ActiveRecord::Migration[5.0]
  def change
    create_table :breeders do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :breed

      t.timestamps
    end
  end
end
