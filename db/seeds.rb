# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Nudie.destroy_all
Appointment.destroy_all


20.times.each_with_index do |idx|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email
  location = Faker::Address.street_address
  gender = Faker::Gender.binary_type
  age = rand(18...50)
  username = Faker::Hipster.word + "_" + Faker::Hipster.word + rand(1..99).to_s
  weight = rand(40..99)
  price = rand(0..200)
  description = Faker::Quote.most_interesting_man_in_the_world
  password = 100000 + idx

  new_user = User.new(username:username, email:email, password:password)
  new_user.first_name = first_name
  new_user.last_name = last_name
  new_user.location = location
  new_user.gender = gender
  new_user.age = age
  new_user.save

  nude = rand(0..1)
  if nude == 1
    new_nudie = Nudie.new(weight:weight, price:price, description:description, user:new_user)
    new_nudie.save
  end
end

5.times do
  first_painter = User.find(2)
  second_painter = User.find(4)
  third_painter = User.find(6)
  fourth_painter = User.find(8)
  fifth_painter = User.find(10)

  first_nudie = Nudie.find(1)
  second_nudie = Nudie.find(3)
  third_nudie = Nudie.find(5)
  fourth_nudie = Nudie.find(7)
  fifth_nudie = Nudie.find(9)

  location = Faker::Address.street_address
  appointment_date = Faker::Date.between(2.days.ago, Date.today)
  appointment = Appointment.new(location:location, appointment_date:appointment_date, user:first_painter, nudie:first_nudie)
  appointment.save
end

lucas = User.create(username: "lucas", email:"lucas@gmail.com", password: 111111)
lucas_n = Nudie.create(weight:78, price:8000, description: "I'm sexy and I know it", user:lucas)
lucas.admin = true

kristian = User.create(username: "kristian", email:"kristian@gmail.com", password: 111111)
kristian_n = Nudie.create(weight:200, price:8000, description: "Looking to make a quick buck", user:kristian)
kristian.admin = true

# Kristian's test code for assigning nudies to users automatically
# User.all.each_with_index do |idx_user|
#   Nudie.all[0...rand(1...6)].each_with_index do |idx_nudie|
#     location = Faker::Address.street_address
#     appointment_date = Faker::Date.between(2.days.ago, Date.today)
#     idx_user == idx_nudie ? false : appointment = Appointment.new(location:location, appointment_date:appointment_date, user:idx_user, nudie:idx_nudie)
#     appointment.save
#   end
# end
