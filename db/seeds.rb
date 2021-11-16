# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             home_town: "HA NOI",
             phone: "0987654231",
             date_birth: "15/05/1855",
             position: "admin",
             status: false)

80.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  home_town = "HA NOI"
  phone = "0"+(123456754+n+10).to_s
  date_birth = "15/05/2010-#{n}"
  position = "member"
  status = false
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               home_town: home_town,
               phone: phone,
               date_birth: date_birth,
               position: position,
               status: status)
end


20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+200}@railstutorial.org"
  password = "password"
  home_town = "HA NOI"
  phone = "0"+(123456754+n+200).to_s
  date_birth = "15/05/2010-#{n}"
  position = "member"
  status = true
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               home_town: home_town,
               phone: phone,
               date_birth: date_birth,
               position: position,
               status: status)
end