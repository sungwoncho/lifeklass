# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "faker"

include ActionView::Helpers::TextHelper

User.destroy_all
Mentors::Mentor.destroy_all
Courses::Course.destroy_all

(1..10).each do |n|
  User.create!(
  name: Faker::Name.name,
  email: "user_#{n}@example.com",
  password: "pass1234"
  )
end

puts "Created #{pluralize User.count, 'user'}."

User.pluck(:id).sample(3).each do |n|
  Mentors::Mentor.create!(
    user_id: n
  )
end

puts "Created #{pluralize Mentors::Mentor.count, 'mentor'}."

20.times do |n|
  Courses::Course.create!(
    mentor_id: Mentors::Mentor.pluck(:id).sample,
    title: Faker::Company.catch_phrase,
    description: Faker::Lorem.paragraphs(3).join
  )
end

puts "Created #{pluralize Courses::Course.count, 'course'}."
