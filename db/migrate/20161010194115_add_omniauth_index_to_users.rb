class AddOmniauthIndexToUsers < ActiveRecord::Migration[5.0]
  def change
    add_index :users, [:uid, :provider]
  end
end
