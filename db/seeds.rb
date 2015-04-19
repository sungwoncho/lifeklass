# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "faker"

include ActionView::Helpers::TextHelper

Users::User.destroy_all
Mentors::Mentor.destroy_all
Courses::Course.destroy_all
Courses::Category.destroy_all
Courses::CourseCategory.destroy_all

puts "Destroyed all previously existing records."

(1..10).each do |n|
  Users::User.create!(
  name: Faker::Name.name,
  email: "user_#{n}@example.com",
  password: "pass1234"
  )
end

puts "Created #{pluralize Users::User.count, 'user'}."

Users::User.pluck(:id).sample(3).each do |n|
  Mentors::Mentor.create!(
    user_id: n
  )
end

puts "Created #{pluralize Mentors::Mentor.count, 'mentor'}."

20.times do |n|
  Courses::Course.create!(
    owner: Mentors::Mentor.all.sample,
    title: Faker::Company.catch_phrase,
    description: Faker::Lorem.paragraphs(3).join
  )
end

puts "Created #{pluralize Courses::Course.count, 'course'}."

15.times do |n|
  Courses::Category.create!(
    name: Faker::Commerce.department(2)
  )
end

puts "Created #{pluralize Courses::Category.count, 'category'}."

Courses::Course.all.each do |course|
  Courses::CourseCategory.create!(
    course_id: course.id,
    category_id: Courses::Category.pluck(:id).sample(3).first
  )
end

puts "Created #{pluralize Courses::CourseCategory.count, 'categorization'}"
