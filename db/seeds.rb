Faker::Config.locale = "pt-BR"

p "-- Iniciando Cadastro de Usuarios..."

User.create!({
  name: "admin",
  email: "admin@admin.com",
  password: "admin123456",
  kind: 1,
})

5.times do |i|
  user = User.create!({
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "1234567#{i}",
    kind: rand(1..2),
  })
end
p "-- Finalizando Cadastro de Usuarios..."
p "--------------------------------------"
p " "
p "-- Iniciando Cadastro de Atendimento médico ..."

15.times do |i|
  medical_appointments = MedicalAppointment.create!({
    user_id: User.all.sample.id,
    title: Faker::Name.name,
    professional_name: Faker::Company.unique.name,
    date: Faker::Date.between(from: "2001-09-23", to: "2022-09-25"),
  })
end
p "-- Finalizando Cadastro de Atendimento médico ..."
p " "
p "--------------------------------------"

p "-- Iniciando Cadastro de Exames ..."
10.times do |i|
  exams = Exam.create!({
    user_id: User.all.sample.id,
    title: Faker::Name.name,
    date: Faker::Date.between(from: "2011-09-23", to: "2022-09-25"),
    exam_location: Faker::Nation.capital_city,
    medical_appointment_id: MedicalAppointment.all.sample.id,
  })
end
p "-- Finalizando Cadastro de Exames ..."
p " "
p "--------------------------------------"

p "-- Iniciando Cadastro de Tratamentos ..."
10.times do |i|
  treatments = Treatment.create!({
    medical_appointment_id: MedicalAppointment.all.sample.id,
    title: Faker::Nation.national_sport,
    description: Faker::Artist.name,
    date: Faker::Date.between(from: "2011-09-23", to: "2022-09-25"),
    treatment_location: Faker::Job.title,
    kind: %i[hemograma colesterol creatinina papanicolau urina glicemia transaminases tsh urocultura].sample,
    user_id: User.all.sample.id,
  })
end
p "-- Finalizando Cadastro de Tratamentos ..."
p " "
p "--------------------------------------"

p "-- Iniciando Cadastro de User Share ..."
10.times do |i|
  userShare = UserShare.create!({
    user_share_id: User.all.sample.id,
    user_id: User.all.sample.id,
    end_date: Faker::Date.between(from: Time.zone.now, to: "2022-12-31"),
    medical_appointment: [true, false].sample,
    exam: [true, false].sample,
    treatment: [true, false].sample,
    status: rand(1..2),
  })
end
p "-- Finalizando Cadastro de User Share ..."
p "--------------------------------------"
