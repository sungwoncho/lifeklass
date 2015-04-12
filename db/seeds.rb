# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "faker"

User.destroy_all
Mentor.destroy_all

(1..10).each do |n|
  User.create!(
  name: Faker::Name.name,
  email: "user_#{n}@example.com",
  password: "pass1234"
  )
end

puts "Created #{User.count} users."

3.times do |n|
  Mentor.create!(
    user_id: (1..10).to_a.sample
  )
end

puts "Created #{Mentor.count} mentors."
