class Region < ApplicationRecord
  attachment :profile_image
  belongs_to :county
  has_many :tasting_rooms
  has_many :wineries, through: :tasting_rooms

  def avg_tasters(month, year)
    total = 0
    count = 0
    self.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        count += 1
        total += ss.num_of_tasters
      end
    end
    avg = total / count
  end

  def avg_purchasers(month, year)
    total = 0
    count = 0

    self.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        count += 1
        total += ss.num_of_purchasers
      end
    end
    avg = total / count
  end

  def avg_club_signups(month, year)
    total = 0
    count = 0

    self.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        count += 1
        total += ss.num_of_club_signups
      end
    end
    avg = total / count
  end

  def avg_sales_in_dollars(month, year)
    total = 0
    count = 0
    self.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        count += 1
        total += ss.sales_in_dollars
      end
    end
    if count > 0
      avg = total / count
    else
      total
    end
  end

  def avg_tasters_purchased(month, year)
    total = 0
    count = 0

    self.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        count += 1
        total += ss.percent_tasters_purcahased
      end
    end
    avg = total / count
  end

  def avg_club_conversion(month, year)
    total = 0
    count = 0
    self.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        count += 1
        total += ss.percent_club_signup
      end
    end
    avg = total / count
  end

  def avg_sales_per_taster(month, year)
    total = 0
    count = 0
    self.tasting_rooms.each do |tr|
      tr.sales_summaries.where(month: month, year: year).each do |ss|
        count += 1
        total += ss.sales_per_taster
      end
    end
    avg = total / count
  end


end
