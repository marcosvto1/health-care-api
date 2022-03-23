json.extract! medical_appointment, :id, :title, :professional_name, :date, :created_at, :updated_at
json.url medical_appointment_url(medical_appointment, format: :json)
