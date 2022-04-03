class ChangeColumnMedicalAppointmentToTreatment < ActiveRecord::Migration[7.0]
  def change
    change_column_null :treatments, :medical_appointment_id, true
  end
end
