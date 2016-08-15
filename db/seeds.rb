# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
sales = SalesSummary.all

sales.each do |ss|
  tasters = rand(3..90)
  purchasers = rand(tasters)
  clubs = rand(tasters/2)
  sales_in_dollars = rand(120.00..200000.00)
  year = 2016
  ss.update(num_of_tasters: tasters,
            num_of_purchasers: purchasers,
            num_of_club_signups: clubs,
            sales_in_dollars: sales_in_dollars
            )
end
