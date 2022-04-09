json.extract! medical_appointment, :id, :title, :professional_name, :created_at, :updated_at
json.date medical_appointment.date.strftime("%d/%m/%Y")
json.files medical_appointment.files_url
