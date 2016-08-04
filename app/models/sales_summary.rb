class SalesSummary < ApplicationRecord
  belongs_to :tasting_room
  has_one :region, through: :tasting_room
  has_one :winery, through: :tasting_room
  #validates :num_of_tasters, presence: true

  ## These are used to calculate the Sales Data
  ##
  ##
  ##


  def percent_tasters_purcahased
    if num_of_tasters.present? && num_of_purchasers.present?
      num_of_purchasers.to_f / num_of_tasters.to_f * 100.0
    else
      nil #0.0
    end
  end
  def percent_club_signup
    if num_of_club_signups.present? && num_of_tasters.present?
      num_of_club_signups.to_f / num_of_tasters.to_f * 100.0
    else
      nil #0.0
    end
  end
  def sales_per_taster
    if sales_in_dollars.present? && num_of_tasters.present?
      sales_in_dollars.to_f / num_of_tasters.to_f
    else
      nil #0.0
    end
  end
  def sales_per_purchase
    if sales_in_dollars.present? && num_of_purchasers.present? && num_of_purchasers > 0
      sales_in_dollars.to_f / num_of_purchasers.to_f
    #elsif sales_in_dollars.present?
    #  sales_in_dollars
    else
      nil #0.0
    end
  end

  ## returns the average for the region
  def avg_tasters
    total = 0
    count = 0
    month = self.month
    year = self.year
    region.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        if ss.num_of_tasters.present?
          count += 1
          total += ss.num_of_tasters
        end
      end
    end
    if count > 0
      avg = total / count
    else
      0
    end
  end
  ## returns the difference for this sales summary from the region average
  def num_of_tasters_percent_different
    #(family winery - average) / family winery
    if self.num_of_tasters.blank?
      0
    else
      (num_of_tasters.to_f / avg_tasters.to_f).to_f * 100.0
    end
  end
  ## all sales summaries from this winery for this year upto the date of this sales summary
  def ytd_num_of_tasters
    winery = self.winery
    tasting_room = self.tasting_room
    year = self.year
    month = self.month
    ytd_ss = tasting_room.sales_summaries.where('year = ? AND month <= ?', year, month)
    total = 0
    ytd_ss.each do |ss|
      total += ss.num_of_tasters if ss.num_of_tasters.present?
    end
    return total
  end

  def avg_purchasers
    total = 0
    count = 0
    month = self.month
    year = self.year
    region.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        if ss.num_of_purchasers.present?
          count += 1
          total += ss.num_of_purchasers
        end
      end
    end
    if count > 0
      avg = total / count
    else
      0
    end
  end
  def num_of_purchasers_percent_different
    #(family winery - average) / family winery
    if self.num_of_purchasers.blank?
      0
    else
      (num_of_purchasers.to_f / avg_purchasers.to_f).to_f * 100.0
    end
  end

  ## calc the number of purchasers year to date
  ##all sales summaries from this winery for this year upto the date of this sales summary
  def ytd_num_of_purchasers
    winery = self.winery
    tasting_room = self.tasting_room
    year = self.year
    month = self.month
    ytd_ss = tasting_room.sales_summaries.where('year = ? AND month <= ?', year, month)
    total = 0
    ytd_ss.each do |ss|
      total += ss.num_of_purchasers if ss.num_of_purchasers.present?
    end
    return total
  end


  def avg_club_signups
    total = 0
    count = 0
    month = self.month
    year = self.year
    region.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        if ss.num_of_club_signups.present?
          count += 1
          total += ss.num_of_club_signups
        end
      end
    end
    if count > 0
      avg = total / count
    else
      0
    end
  end
  def num_of_club_signups_percent_different
    if self.num_of_club_signups.blank?
      0
    else
      (num_of_club_signups.to_f / avg_club_signups.to_f).to_f * 100.0
    end
  end


  def avg_sales_in_dollars
    total = 0
    count = 0
    month = self.month
    year = self.year
    region.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        if ss.sales_in_dollars.present?
          count += 1
          total += ss.sales_in_dollars
        end
      end
    end
    if count > 0
      avg = total / count
    else
      0
    end
  end
  def sales_in_dollars_percent_different
    if sales_in_dollars.blank?
      0
    else
      (sales_in_dollars.to_f / avg_sales_in_dollars.to_f).to_f * 100.0
    end
  end

  ## conversion ratio
  def avg_tasters_purchased
    total = 0
    count = 0
    month = self.month
    year = self.year
    region.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        if ss.percent_tasters_purcahased.present?
          count += 1
          total += ss.percent_tasters_purcahased
        end
      end
    end
    if count > 0
      avg = total / count
    else
      0.0
    end
  end
  def conversion_percent_different
    if self.percent_tasters_purcahased.blank?
      0
    else
      (percent_tasters_purcahased.to_f / avg_tasters_purchased.to_f).to_f * 100.0
    end
  end


  def avg_club_conversion
    total = 0
    count = 0
    month = self.month
    year = self.year
    region.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        if ss.percent_club_signup.present?
          count += 1
          total += ss.percent_club_signup
        end
      end
    end
    if count > 0
      avg = total / count
    else
      0
    end
  end
  def club_conversion_percent_different
    if percent_club_signup.blank?
      0
    else
      (percent_club_signup.to_f / avg_club_conversion.to_f).to_f * 100.0
    end
  end


  def avg_sales_per_taster
    total = 0
    count = 0
    month = self.month
    year = self.year
    region.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        if ss.sales_per_taster.present?
          count += 1
          total += ss.sales_per_taster
        end
      end
    end
    if count > 0
      avg = total / count
    else
      0
    end
  end
  def sales_per_taster_percent_different
    if sales_per_taster.blank?
      0
    else
      (sales_per_taster.to_f / avg_sales_per_taster.to_f).to_f * 100.0
    end
  end


  def avg_sales_per_purchase
    total = 0
    count = 0
    month = self.month
    year = self.year
    region.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        if ss.sales_per_purchase.present?
          count += 1
          total += ss.sales_per_purchase
        end
      end
    end
    if count > 0
      avg = total / count
    else
      0
    end
  end
  def sales_per_purchase_percent_different
    if self.sales_per_purchase.blank?
      0
    else
      (sales_per_purchase.to_f / avg_sales_per_purchase.to_f).to_f * 100.0
    end
  end


  # variance. NOT USED
  def num_of_tasters_variance
    #(family winery - average) / family winery
    (num_of_tasters - avg_tasters).to_f / num_of_tasters.to_f * 100.0
  end
  def num_of_purchasers_variance
    #(family winery - average) / family winery
    (num_of_purchasers - avg_purchasers).to_f / num_of_purchasers.to_f * 100.0
  end
  def num_of_club_signups_variance
    #(family winery - average) / family winery
    (num_of_club_signups - avg_club_signups).to_f / num_of_club_signups.to_f * 100.0
  end
  def sales_in_dollars_variance
    #(family winery - average) / family winery
    (sales_in_dollars - avg_sales_in_dollars).to_f / sales_in_dollars.to_f * 100.0
  end
  def conversion_variance
    #(family winery - average) / family winery
    (percent_tasters_purcahased - avg_tasters_purchased).to_f / percent_tasters_purcahased.to_f * 100.0
  end
  def club_conversion_variance
    #(family winery - average) / family winery
    (percent_club_signup - avg_club_conversion).to_f / percent_club_signup.to_f * 100.0
  end
  def sales_per_taster_variance
    #(family winery - average) / family winery
    (sales_per_taster - avg_sales_per_taster).to_f / sales_per_taster.to_f * 100.0
  end
  def sales_per_purchase_variance
    #(family winery - average) / family winery
    (sales_per_purchase - avg_sales_per_purchase).to_f / sales_per_purchase.to_f * 100.0
  end

end
