json.extract! treatment, :id, :title, :description, :treatment_location, :kind, :medical_appointment_id, :created_at, :updated_at
json.date treatment.date.strftime("%d/%m/%Y")
json.files treatment.files_url
