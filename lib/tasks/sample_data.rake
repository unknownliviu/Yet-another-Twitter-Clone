namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Chuck Norris",
                 email: "gmail@Chuck.ru",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)

    99.times do |n|
      name  = Faker::Name.name
      email = "gmail#{n+1}@Chuck.ru"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    users = User.all(limit: 6)
    52.times do
      content = Faker::Lorem.sentence(5)
      users.each { |u| u.microposts.create!(content: content) }
    end
  end
end
