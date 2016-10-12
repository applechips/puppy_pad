class CreateWeights < ActiveRecord::Migration[5.0]
  def change
    create_table :weights do |t|
      t.float :weight
      t.string :date
      t.timestamps
    end
  end
end
