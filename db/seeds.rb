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
             phone: 987654231,
             date_birth: "15/05/1855",
             position: "member",
             status: "0")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  home_town = "HA NOI",
  phone = 123456754+n+10,
  date_birth = "15/05/2010-#{n}"
  position = "member"
  status = "0"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               home_town: home_town,
               phone: phone,
               date_birth: date_birth,
               position: position,
               status: status)
end