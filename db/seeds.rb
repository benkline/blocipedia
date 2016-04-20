# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "random_data"

# Create Users
5.times do
  user = User.create!(
  email:    Faker::Internet.email,
  password: "helloworld",
  role:  rand(0..2),
  confirmed_at: Time.now
  )

  user.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
  user.update_attribute(:updated_at, rand(10.minutes .. 1.year).ago)
end

users = User.all

# Create Pages
10.times do
  page = Page.create!(
    creator: users.sample,
    collaborators: users.sample(2),
    title: Faker::Book.title,
    body: Faker::Hipster.paragraph(2),
    private: Faker::Boolean.boolean(0.2)
  )

 page.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
 page.update_attribute(:updated_at, rand(10.minutes .. 1.year).ago)
end

pages = Page.all

#print results
puts "Seed finished"
puts "#{User.count} users created"
puts "#{Page.count} pages created"
