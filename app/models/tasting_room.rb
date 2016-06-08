class TastingRoom < ApplicationRecord
  attachment :profile_image
  belongs_to :region
  belongs_to :winery
  has_many :sales_summaries

  #scope :sales_summaries_this_year, -> {
#      where('orders.id >= ?', 220000)
#   }

  def sales_summaries_this_year
    cur_year = Date.today.year
    sales_summaries.where(year: cur_year)
  end
  def missing_months_this_year
    last_month = Date.today.month - 1
    cur_year = Date.today.year
    entered = self.sales_summaries.where(year: cur_year).count
    return last_month - entered
  end

  def as_csv
  CSV.generate do |csv|
    csv << ["Num of tasters", "Num of purchasers", "Percent That Purchased",
      "Num of club signups", "Percentage of club signups", "Sales in dollars", "Year", "Month" ]
      #sales_summary.tasting_room.region.name,
    self.sales_summaries.order(year: :desc, month: :desc ).each do |sales_summary|
      csv << [
        sales_summary.num_of_tasters,
        sales_summary.num_of_purchasers,
        sales_summary.percent_tasters_purcahased.round(1),
        sales_summary.num_of_club_signups,
        sales_summary.percent_club_signup.round(1),
        sales_summary.sales_in_dollars,
        sales_summary.year,
        Date::MONTHNAMES[sales_summary.month] ]
    end
  end
end
end
