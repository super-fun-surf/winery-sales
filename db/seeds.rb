# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Luke",
             email: "lukeallen@gmail.com",
             password:              "donkey",
             password_confirmation: "donkey",
             permissions: 10,
             activated_at: Time.zone.now)
 User.create!(name:  "Donkey",
              email: "donkey@donkeydonkey.net",
              password:              "donkey",
              password_confirmation: "donkey",
              permissions: 3,
              activated_at: Time.zone.now)

20.times do |n|
  name  = Faker::Name.name
  title = Faker::Name.title
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  #w = Winery.all.count
  #winery = Winery.find(1..w)
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               title: title,
               permissions: 3,
               activated_at: Time.zone.now)
end



County.create!(name:  "Mendocino",
               population: 88000
               )


10.times do |n|
  name  = Faker::Address.city
  county = County.find_by(name: "Mendocino")
  Region.create!(name:  name,
               county: county
               )
end


52.times do |n|
  name  = Faker::Company.name
  num_of_employees = rand(46)
  year_established = rand(1900..2016)
  c = Region.all.count
  region = Region.find(rand(1..c))
  Winery.create!(name:  name,
               num_of_employees: num_of_employees,
               year_established: year_established,
               region: region
               )
end
