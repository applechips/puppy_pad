class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.string :sex
      t.string :birthday
      t.string :colour
      t.string :breeder

      t.timestamps
    end
  end
end
