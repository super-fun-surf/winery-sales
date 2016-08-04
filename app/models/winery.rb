class Winery < ApplicationRecord
  attachment :profile_image
  has_many :tasting_rooms, dependent: :destroy
  has_many :regions, through: :tasting_rooms
  has_many :counties, through: :regions
  has_many :winery_users, dependent: :destroy
  has_many :users, through: :winery_users

  def self.as_csv(month = Date.today.month, year = Date.today.year)

    CSV.generate do |csv|
      csv << ["Winery",
        "Locale",
        "Estate",
        "Employees",
        "Cases Sold 2015",
        "Tasters",
        "Tasters YTD",
        "Purchases",
        "Purchases YTD",
        "Sales",
        "Clubs"
      ]
      self.order(name: :asc).each do |winery|
        winery.tasting_rooms.each do |tr|
          ss = tr.sales_summaries.where(year: year, month: month ).first
          if ss.present?
          csv << [ winery.name,
            tr.region.name,
            tr.estate,
            winery.num_of_employees,
            winery.cases_sold_2015,
            ss.num_of_tasters,
            ss.ytd_num_of_tasters,
            ss.num_of_purchasers,
            ss.ytd_num_of_purchasers,
            ss.sales_in_dollars,
            ss.num_of_club_signups
          ]
          else
            csv << [ winery.name,
              tr.region.name,
              tr.estate,
              winery.num_of_employees,
              winery.cases_sold_2015,
              "nil",
              tr.ytd_num_of_tasters(year, month),
              "nil",
              tr.ytd_num_of_purchasers(year, month),
              "nil",
              "nil"
            ]
          end
        end
      end
    end
  end
end
