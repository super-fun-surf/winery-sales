class Region < ApplicationRecord
  ## This File has most of the heavy lifting for finding the region averages
  ## These methods reference the sales summaries for each region
  ## and the sales summaries have functions for calculating values that calculated from the associated DB fields
  ## this file so far has mainly 2 functions that are written specificically for each category/field of Sales Data.
  ## the 2 functions are Average and Number Reporting.
  attachment :profile_image
  belongs_to :county
  has_many :tasting_rooms
  has_many :wineries, through: :tasting_rooms

  ## the avg function returns the average of this category/field in this region for this time period
  def avg_tasters(month, year)
    total = 0
    count = 0
    self.tasting_rooms.each do |tr|
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
  ## the reporting function returns the number of wineries that have reported data for this category/field
  def reporting_tasters(month, year)
    count = 0
    self.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        count += 1 if ss.num_of_tasters.present?
      end
    end
    count
  end

  def avg_purchasers(month, year)
    total = 0
    count = 0

    self.tasting_rooms.each do |tr|
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
  def reporting_purchasers(month, year)
    count = 0
    self.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        count += 1 if ss.num_of_purchasers.present?
      end
    end
    count
  end

  def avg_club_signups(month, year)
    total = 0
    count = 0
    self.tasting_rooms.each do |tr|
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
      total
    end
  end
  def reporting_club_signups(month, year)
    count = 0
    self.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        count += 1 if ss.num_of_club_signups.present?
      end
    end
    count
  end

  def avg_sales_in_dollars(month, year)
    total = 0
    count = 0
    self.tasting_rooms.each do |tr|
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
      total
    end
  end
  def reporting_sales_in_dollars(month, year)
    count = 0
    self.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        count += 1 if ss.sales_in_dollars.present?
      end
    end
    count
  end

  def avg_tasters_purchased(month, year)
    total = 0
    count = 0
    self.tasting_rooms.each do |tr|
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
      total
    end
  end
  def reporting_tasters_purchased(month, year)
    count = 0
    self.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        count += 1 if ss.percent_tasters_purcahased.present?
      end
    end
    count
  end

  def avg_club_conversion(month, year)
    total = 0
    count = 0
    self.tasting_rooms.each do |tr|
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
      total
    end
  end
  def reporting_club_conversion(month, year)
    count = 0
    self.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        count += 1 if ss.percent_club_signup.present?
      end
    end
    count
  end

  def avg_sales_per_taster(month, year)
    total = 0
    count = 0
    self.tasting_rooms.each do |tr|
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
      total
    end
  end
  def reporting_sales_per_taster(month, year)
    count = 0
    self.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        count += 1 if ss.sales_per_taster.present? #sales_in_dollars.present? && num_of_tasters.present? #
      end
    end
    count
  end

  def avg_sales_per_purchase(month, year)
    total = 0
    count = 0
    self.tasting_rooms.each do |tr|
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
      total
    end
  end
  def reporting_sales_per_purchase(month, year)
    count = 0
    self.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        count += 1 if ss.sales_per_purchase.present?
      end
    end
    count
  end

end
