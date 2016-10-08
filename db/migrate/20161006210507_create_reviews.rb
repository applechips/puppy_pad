class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :body
      t.integer :star_count

      t.timestamps
    end
  end
end
