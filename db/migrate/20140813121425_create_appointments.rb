class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :physician_id , :null => false
      t.integer :patient_id , :null => false
      t.string :appointment_type
      t.timestamps
    end
  end
end
