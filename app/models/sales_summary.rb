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

  def num_of_tasters_percent_different
    #(family winery - average) / family winery
    (num_of_tasters - avg_tasters).to_f / num_of_tasters.to_f * 100.0
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

  def num_of_purchasers_percent_different
    #(family winery - average) / family winery
    (num_of_purchasers - avg_purchasers).to_f / num_of_purchasers.to_f * 100.0
  end
  def avg_purchasers
    total = 0
    count = 0
    month = self.month
    year = self.year
    region.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        count += 1
        total += ss.num_of_purchasers
      end
    end
    avg = total / count
  end

  def num_of_club_signups_percent_different
    #(family winery - average) / family winery
    (num_of_club_signups - avg_club_signups).to_f / num_of_club_signups.to_f * 100.0
  end
  def avg_club_signups
    total = 0
    count = 0
    month = self.month
    year = self.year
    region.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        count += 1
        total += ss.num_of_club_signups
      end
    end
    avg = total / count
  end

  def sales_in_dollars_percent_different
    #(family winery - average) / family winery
    (sales_in_dollars - avg_sales_in_dollars).to_f / sales_in_dollars.to_f * 100.0
  end
  def avg_sales_in_dollars
    total = 0
    count = 0
    month = self.month
    year = self.year
    region.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        count += 1
        total += ss.sales_in_dollars
      end
    end
    avg = total / count
  end

  def conversion_percent_different
    #(family winery - average) / family winery
    (percent_tasters_purcahased - avg_tasters_purchased).to_f / percent_tasters_purcahased.to_f * 100.0
  end
  def avg_tasters_purchased
    total = 0
    count = 0
    month = self.month
    year = self.year
    region.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        count += 1
        total += ss.percent_tasters_purcahased
      end
    end
    avg = total / count
  end

  def club_conversion_percent_different
    #(family winery - average) / family winery
    (percent_club_signup - avg_club_conversion).to_f / percent_club_signup.to_f * 100.0
  end
  def avg_club_conversion
    total = 0
    count = 0
    month = self.month
    year = self.year
    region.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        count += 1
        total += ss.percent_club_signup
      end
    end
    avg = total / count
  end

  def sales_per_taster_percent_different
    #(family winery - average) / family winery
    (sales_per_taster - avg_sales_per_taster).to_f / sales_per_taster.to_f * 100.0
  end
  def avg_sales_per_taster
    total = 0
    count = 0
    month = self.month
    year = self.year
    region.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        count += 1
        total += ss.sales_per_taster
      end
    end
    avg = total / count
  end
end
