class CreateMedicalAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :medical_appointments do |t|
      t.string :title, null: false
      t.string :professional_name, null: false
      t.date :date

      t.timestamps
    end
  end
end
