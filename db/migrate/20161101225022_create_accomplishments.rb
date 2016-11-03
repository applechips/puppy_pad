class CreateAccomplishments < ActiveRecord::Migration[5.0]
  def change
    create_table :accomplishments do |t|
      t.string :title
      t.string :body
      t.references :pet, foreign_key: true
      
      t.timestamps
    end

  end
end
