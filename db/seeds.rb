50.times do
  User.create!(
    email:    Faker::Internet.email,
    password: Faker::Internet.password
  )
end

users = User.all

50.times do
  Wiki.create!(
    title:  Faker::Hacker.say_something_smart,
    body:   Faker::Lorem.paragraph,
    private: false,
    user: users.sample
  )
end

admin = User.create!(
  email: "luna.kang.ca@gmail.com",
  password: "helloworld",
)
admin.add_role :admin

standard_member = User.create!(
  email: "standard@bloc.com",
  password: "helloworld",
)
standard_member.add_role :standard

premium_member = User.create!(
  email: "premium@bloc.com",
  password: "helloworld",
)
premium_member.add_role :premium

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
