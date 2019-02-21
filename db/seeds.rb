# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)
require 'faker'

Appointment.destroy_all
Nudie.destroy_all
User.destroy_all


9.times.each_with_index do |idx|
  first_name = Faker::Name.female_first_name
  last_name = Faker::Name.last_name
  email = "#{first_name}.#{last_name}@#{Faker::Hipster.word}.com"
  location = Faker::Address.street_address
  gender = "Female"
  age = rand(18...28)
  username = Faker::Hipster.word + "_" + Faker::Hipster.word + rand(1..99).to_s
  weight = rand(40..60)
  price = rand(0..200)
  description = Faker::Quote.most_interesting_man_in_the_world.gsub("HIS", "HER").gsub("He", "She").gsub(" he", " she").gsub("his", "her").gsub("His", "Her")
  password = 100000
  url = "https://res.cloudinary.com/dcteumtl0/image/upload/v1550763608/hotgirl#{idx+1}.jpg"
  new_user = User.new(username:username, email:email, password:password)
  new_user.first_name = first_name
  new_user.last_name = last_name
  new_user.location = location
  new_user.gender = gender
  new_user.age = age
  new_user.remote_photo_url = url
  new_user.save!
  new_nudie = Nudie.create!(user: new_user, weight: weight, price:price, description:description)
end

6.times.each_with_index do |idx|
  first_name = Faker::Name.male_first_name
  last_name = Faker::Name.last_name
  email = "#{first_name}.#{last_name}@#{Faker::Hipster.word}.com"
  location = Faker::Address.street_address
  gender = "Male"
  age = rand(18...28)
  username = Faker::Hipster.word + "_" + Faker::Hipster.word + rand(1..99).to_s
  weight = rand(40..60)
  price = rand(0..200)
  description = Faker::Quote.most_interesting_man_in_the_world
  password = 100000
  url = "https://res.cloudinary.com/dcteumtl0/image/upload/v1550763608/hotguy#{idx+1}.jpg"
  new_user = User.new(username:username, email:email, password:password)
  new_user.first_name = first_name
  new_user.last_name = last_name
  new_user.location = location
  new_user.gender = gender
  new_user.age = age
  new_user.remote_photo_url = url
  new_user.save!
  new_nudie = Nudie.create!(user: new_user, weight: weight, price:price, description:description)
end


5.times.each_with_index do |idx|
  location = Faker::Address.street_address
  appointment_date = Faker::Date.between(2.days.ago, Date.today)
  appointment = Appointment.new(location:location, appointment_date:appointment_date, user:User.find(idx+8), nudie:Nudie.find(idx+1))
  appointment.save!
end

lucas = User.create!(username: "lucas", first_name: "Lucas", last_name:"Cheung", location:"London", gender: "Male", age: 25, email:"lucas@gmail.com", password: 111111)
lucas.remote_photo_url = "https://res.cloudinary.com/dcteumtl0/image/upload/v1550753543/arnold.jpg"
lucas_n = Nudie.create!(weight:78, price:8000, description: "I fear not the man who has practiced 10,000 kicks once, but I fear the man who has practiced one kick 10,000 times.", user:lucas)
lucas.admin = true
lucas.save!

kristian = User.create!(username: "kristian", first_name: "Kristian", last_name:"Soelling", location:"Copenhagen", gender: "Male", age: 27, email:"kristian@gmail.com", password: 111111)
kristian.remote_photo_url = "https://res.cloudinary.com/dcteumtl0/image/upload/v1550591281/kristian.jpg"
kristian_n = Nudie.create!(weight:200, price:8000, description: "Looking to make a quick buck", user:kristian)
kristian.admin = true
kristian.save!

max = User.create!(username: "max", first_name: "Max", last_name:"Glasmacher", location:"Berlin", gender: "Male", age: 18, email:"max@gmail.com", password: 111111)
max.remote_photo_url = "https://res.cloudinary.com/dcteumtl0/image/upload/v1550591281/max.jpg"
max.save!
max_n = Nudie.create!(weight:200, price:8000, description: "Please bring tweezers for managing my sensitive genitals", user:max)

# Kristian's test code for assigning nudies to users automatically
# User.all.each_with_index do |idx_user|
#   Nudie.all[0...rand(1...6)].each_with_index do |idx_nudie|
#     location = Faker::Address.street_address
#     appointment_date = Faker::Date.between(2.days.ago, Date.today)
#     idx_user == idx_nudie ? false : appointment = Appointment.new(location:location, appointment_date:appointment_date, user:idx_user, nudie:idx_nudie)
#     appointment.save!
#   end
# end
