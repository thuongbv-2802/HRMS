# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Department.create!(name:"HR", description: "Humnan Resource")
Department.create!(name:"QA", description: "Quanlity Assurance")
Department.create!(name:"AC", description: "Accountance")

# add hr--------------------
User.create!(name:  "HR User",
             email: "example-hr@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             home_town: "HA NOI",
             phone: "0987654231",
             date_birth: "15/05/1855",
             position: "admin",
             department_id: 1)

70.times do |n|
  name  = Faker::Name.name
  email = "example#{n+1}-hr@gmail.com"
  password = "password"
  home_town = "Nam Tu Liem - Ha Noi"
  phone = "0"+(123456754+n+10).to_s
  date_birth = "15/05/2010-#{n}"
  position = "staff"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               home_town: home_town,
               phone: phone,
               date_birth: date_birth,
               position: position,
               department_id: 1)
end

5.times do |n|
    name  = Faker::Name.name
    email = "exampleintern#{n+200}-hr@gmail.com"
    password = "password"
    home_town = "Bac Tu Liem - Ha Noi"
    phone = "0"+(123456754+n+200).to_s
    date_birth = "15/05/2010-#{n}"
    position = "intern"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password,
                 home_town: home_town,
                 phone: phone,
                 date_birth: date_birth,
                 position: position,
                 department_id: 1)
end

# add QA --------------------------
User.create!(name:  "QA User",
             email: "example-qa@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             home_town: "HCM",
             phone: "0987653431",
             date_birth: "15/05/1985",
             position: "admin",
             department_id: 2)

70.times do |n|
    name  = Faker::Name.name
    email = "example#{n+1}-qa@gmail.com"
    password = "password"
    home_town = "Nam Tu Liem - Ha Noi"
    phone = "0"+(123456754+n+10).to_s
    date_birth = "15/05/2010-#{n}"
    position = "staff"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password,
                 home_town: home_town,
                 phone: phone,
                 date_birth: date_birth,
                 position: position,
                 department_id: 2)
end

5.times do |n|
    name  = Faker::Name.name
    email = "exampleleave#{n+200}-qa@gmail.com"
    password = "password"
    home_town = "Bac Tu Liem - Ha Noi"
    phone = "0"+(123456754+n+200).to_s
    date_birth = "15/05/2010-#{n}"
    position = "staff"
    status = false
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password,
                 home_town: home_town,
                 phone: phone,
                 date_birth: date_birth,
                 position: position,
                 status: status,
                 department_id: 2)
end

# add AC ---------------------------
User.create!(name:  "AC User",
             email: "example-ac@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             home_town: "DN",
             phone: "0987623431",
             date_birth: "15/05/1985",
             position: "admin",
             department_id: 3)



70.times do |n|
    name  = Faker::Name.name
    email = "example#{n+1}-ac@gmail.com"
    password = "password"
    home_town = "Nam Tu Liem - Ha Noi"
    phone = "0"+(123456754+n+10).to_s
    date_birth = "15/05/2010-#{n}"
    position = "staff"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password,
                 home_town: home_town,
                 phone: phone,
                 date_birth: date_birth,
                 position: position,
                 department_id: 3)
end
