require 'faker'

50.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end
posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

post = Post.find_or_create_by!(
  title: "New Town",
  body: "New town is the best part of town"
)

Comment.find_or_create_by!(
  post: post,
  body: "I love New Town"
)

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
