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
 User.create!(name:  "John K",
              email: "john@westcompany.org",
              password:              "geterdone",
              password_confirmation: "geterdone",
              permissions: 10,
              activated_at: Time.zone.now)

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


12.times do |n|
  name  = Faker::Name.name
  title = Faker::Name.title
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  #w = Winery.all.count
  #winery = Winery.find(1..w)
  user = User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               title: title,
               permissions: 3,
               activated_at: Time.zone.now)
   name  = Faker::Company.name
   num_of_employees = rand(46)
   year_established = rand(1900..2016)
   winery = Winery.create!(name:  name,
                num_of_employees: num_of_employees,
                year_established: year_established,
                )
    WineryUser.create!(user: user, winery: winery)
end






#12.times do |n|

#end

20.times do |n|
  name  = Faker::Company.name
  num_of_employees = rand(13)
  year_established = rand(1900..2016)
  c = Region.all.count
  region = Region.find(rand(1..c))
  estate = rand(1)
  w = Winery.all.count
  winery = Winery.find(rand(1..w))
  room = TastingRoom.create!(name:  name,
               num_of_employees: num_of_employees,
               year_established: year_established,
               region: region,
               estate: estate,
               winery: winery
               )
  month = 1
  4.times do |sale|
    tasters = rand(3..90)
    purchasers = rand(tasters)
    clubs = rand(tasters/2)
    sales_in_dollars = rand(120.00..30000.00)
    year = 2016
    chance = rand(5)
    if chance < 4
      SalesSummary.create!(tasting_room: room,
                        num_of_tasters: tasters,
                        num_of_purchasers: purchasers,
                        num_of_club_signups: clubs,
                        sales_in_dollars: sales_in_dollars,
                        month: month,
                        year: year
                        )
    end
    month = month + 1
  end
  month = 1
  12.times do |sale|
    tasters = rand(3..90)
    purchasers = rand(tasters)
    clubs = rand(tasters/2)
    sales_in_dollars = rand(120.00..30000.00)
    year = 2015
    #chance = rand(5)
    #if chance < 4
      SalesSummary.create!(tasting_room: room,
                        num_of_tasters: tasters,
                        num_of_purchasers: purchasers,
                        num_of_club_signups: clubs,
                        sales_in_dollars: sales_in_dollars,
                        month: month,
                        year: year
                        )
    #end
    month = month + 1
  end

end
