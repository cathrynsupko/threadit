# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: "foobar",
            password: "foobar",
            password_confirmation: "foobar")

20.times do |n|
  name = FFaker::Internet.user_name
  password = "foobar"
  User.create!(name: name,
                password: password,
                password_confirmation: password)
end

20.times do |n|
  title = FFaker::HipsterIpsum.phrase
  author = rand(20)+1
  content = FFaker::HipsterIpsum.paragraph
  votes = rand(100)
  Post.create!(title: title,
                body: content,
                votes: votes,
                author_id: author)
end

50.times do |n|
  user = rand(20)+1
  post = rand(20)+1
  content = FFaker::HipsterIpsum.sentence
  
  Comment.create!(content: content,
                  post_id: post,
                  user_id: user)
end


30.times do |n|
  user = rand(20)+1
  parent = rand(50)+1
  content = FFaker::HipsterIpsum.sentence
  Comment.create!(content: content,
                  parent_id: parent,
                  user_id: user)
end

50.times do |n|
  user = rand(20)+1
  parent = rand(80)+1
  content = FFaker::HipsterIpsum.sentence
  Comment.create!(content: content,
                  parent_id: parent,
                  user_id: user)
end
        