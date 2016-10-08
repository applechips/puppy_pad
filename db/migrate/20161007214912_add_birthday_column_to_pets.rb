class AddBirthdayColumnToPets < ActiveRecord::Migration[5.0]
  def change
    remove_column :pets, :birthday, :string
    add_column :pets, :birthday, :string
    add_column :pets, :birthday_month, :string
    add_column :pets, :birthday_year, :string
  end
end
