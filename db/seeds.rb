Physician.destroy_all
Patient.destroy_all
Appointment.destroy_all

specialties = ["Anesthesiology", "Cardiology", "Plastic Surgery", "Hematology", "Neuromedicine", "Dermatology", "Internal Medicine", "Digestive Health", "Endocrinology", "General Surgery"]
languages = ["English", "French", "German", "Romanian", "Arabic", "Hebrew", "English", "English", "Chinese", "Spanish"]
sex = ["Male", "Female"]

20.times do
  physician = Physician.create(
    name: Faker::Name.name,
    specialty: specialties.sample,
    phone: Faker::PhoneNumber.cell_phone,
    education: Faker::Educator.university,
  )
  rand(2...50).times do
    patient = Patient.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      dob: Faker::Date.birthday(18, 100),
      age: nil,
      language: languages.sample,
      sex: sex.sample,
      phone: Faker::PhoneNumber.cell_phone,
      street: Faker::Address.street_name,
      city: Faker::Address.city,
      state: Faker::Address.state_abbr,
      zip: Faker::Address.zip,
    )
    rand(1...5).times do
      Appointment.create(
        time: Faker::Time.between(DateTime.now - 1, DateTime.now),
        patient_id: patient.id,
        physician: physician.id,
      )
    end
  end
end

@patients = Patient.all
@patients.each do |p|
  age = (Time.current.year - p.dob.year)
  p.update(age: age)
end

puts "Seeding Successful!"
