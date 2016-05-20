class SalesSummary < ApplicationRecord
  belongs_to :tasting_room
  has_one :region, through: :tasting_room

  def percent_tasters_purcahased
    num_of_purchasers.to_f / num_of_tasters.to_f * 100.0
  end
  def percent_club_signup
    num_of_club_signups.to_f / num_of_tasters.to_f * 100.0
  end
  def sales_per_taster
    sales_in_dollars / num_of_tasters.to_f
  end

  def avg_tasters
    total = 0
    count = 0
    month = self.month
    year = self.year
    region.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        count += 1
        total += ss.num_of_tasters
      end
    end
    avg = total / count
  end
end
