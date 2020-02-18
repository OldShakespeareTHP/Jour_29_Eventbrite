# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

10.times do
  email_ = Faker::Games::Pokemon.unique.name + "@yopmail.com"
  User.create(
     first_name: Faker::Name.first_name,
     last_name: Faker::Name.last_name,
     description: Faker::Books::Lovecraft.sentence(word_count: 10),
     email: email_,
     password: "123456"
     )
end
puts "Users created : #{User.count}, expected : 10"

2.times do
  Event.create(
    start_date: Time.now + rand(1..10) * 86400,
    duration: 5 + rand(1..50) * 5,
    title: Faker::Books::Lovecraft.tome,
    description: Faker::Books::Lovecraft.sentence(word_count: 20),
    price: rand(1..1000),
    location: Faker::Books::Lovecraft.location,
    administrator: User.all.sample
  )
end
puts "Events created : #{Event.count}, expected : 2"


8.times do
  event_ = Event.all.sample
  # without_guest = User.all - Event.administrator
  while (event_.administrator == (guest_ = User.all.sample))
  end 

  Participation.create(
    user: guest_,
    event: event_
  )
end
puts "Participations created : #{Participation.count}, expected : 8"
puts "Email\n"
puts "Utilisateurs : \n"
User.all.each { |user| puts user.email }
puts "**************************************************************"
puts "\nAdministrateurs : \n"
Participation.all.each { |participation| puts participation.event.administrator.email }