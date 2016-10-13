# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create name: "admin",
  email: "admin@admin.com",
  password: "123456",
  password_confirmation: "123456",
  tel: "0120759255",
  admin: true

User.create name: "nobita",
  email: "nobita@123.com",
  password: "123456",
  password_confirmation: "123456",
  tel: "0123456789",
  admin: true

 99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create name: name,
    email: email,
    password: password,
    password_confirmation: password,
    tel: "0123456789",
    admin: false
end
Category.create name: "Fast Food"
Category.create name: "Alcohol"
Category.create name: "Gas drink"
Category.create name: "Drink"
