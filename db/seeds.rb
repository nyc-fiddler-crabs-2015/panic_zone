# 3.times do
#   user = User.create(name: Faker::Name.name,
#                   password: "12345",)
#   5.times do
#     post = user.posts.create(title: Faker::Lorem.word)
#     6.times do
#       comments = user.comments.create(text: Faker::Lorem.sentence + "?")
#     end
#   end
# end


# user1 = User
# user2 = User
# user3 = User
# user4 = User

user = User.create(name: "Dan", password: "dan")

Post.create(title: "what is this?", content:"I'm panicking",user_id: user.id)
Post.create(title: "what is this?", content: "someone help me!", user_id: user.id)