3.times do
  user = User.create(name: Faker::Name.name,
                  password: "12345",)
  5.times do
    post = user.posts.create(title: Faker::Lorem.word)
    6.times do
      comments = user.comments.create(text: Faker::Lorem.sentence + "?")
    end
  end
end
