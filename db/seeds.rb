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
  User.create!(
  email:    RandomData.random_email,
  password: RandomData.random_word
  )
end
users = User.all

# #create cities
# 15.times do
#   Cities.create!(
#     name: RandomData.random_word,
#     description: RandomData.random_paragraph
#     integer: (for enum hash)
#   )
# end
# topics = Citi.all

# #create pages
50.times do
  page = Page.create!(
    user: users.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    private: false
  )

# page.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
#
# rand(1..5).times { post.votes.create!(value:[-1,1].sample, user: users.sample) }

end

pages = Page.all

###create comments

# 100.times do
#   Comment.create!(
#     user: users.sample,
#     post: posts.sample,
#     body: RandomData.random_paragraph
#   )
# end
#
# admin = User.create!(
#   name: 'Admin User',
#   email: 'admin@example.com',
#   password: 'helloworld',
#   role: 'admin'
# )
#
# member = User.create!(
#   name: 'Member User',
#   email: 'member@example.com',
#   password: 'helloworld'
# )

#print results
puts "Seed finished"
puts "#{User.count} users created"
puts "#{Page.count} posts created"
#puts "#{Citi.count} votes created"
#puts "#{Vote.count} votes created"
