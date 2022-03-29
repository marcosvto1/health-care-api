json.extract! medical_appointment, :id, :title, :professional_name, :date, :created_at, :updated_at
json.files medical_appointment.files_url
# json.url medical_appointment_url(medical_appointment, format: :json)
