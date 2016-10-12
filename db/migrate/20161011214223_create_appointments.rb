class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.string :name
      t.string :phone_number
      t.string :time
      t.string :time_zone

      t.timestamps
    end
  end
end
