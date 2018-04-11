# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# create test users
(1..2).each do |number|
  User.create(name: 'testuser' + number.to_s, email: 'TestUser' + number.to_s + '@microposts.com', password: '12345')
end

# create test posts
(1..25).each do |number|
  Micropost.create(content: Faker::Lorem.sentence(5), user_id: 1 )
end
(26..50).each do |number|
  Micropost.create(content: Faker::Lorem.sentence(5), user_id: 2 )
end

# dammy data
50.times do
  User.create(name: Faker::Name.name, email: Forgery('email').address, password: '12345')
end

users = User.order(:created_at)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end


# follow
users = User.all
user  = users.first
following = users[1..52]
followers = users[2..30]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

# favorite
#users = User.all
#user = users.first
#liker  = users[1..52]
#micropost = Micropost.all
#favorite = microposts[1..125]
#favorite.each do |m|
#  liker.each do |u|
#  end
#end
