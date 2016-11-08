class AddTwitterInfoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :twitter_token, :string
    add_column :users, :twitter_secret, :string
    add_column :users, :twitter_raw_data, :text  
  end
end
