class AddUserReferencesToVets < ActiveRecord::Migration[5.0]
  def change
    add_reference :vets, :user, foreign_key: true
  end
end
