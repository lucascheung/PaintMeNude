class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :appointment_date
      t.string :location
      t.references :user, foreign_key: true
      t.references :nudie, foreign_key: true

      t.timestamps
    end
  end
end
