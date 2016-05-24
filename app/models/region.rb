class Region < ApplicationRecord
  attachment :profile_image
  belongs_to :county
  has_many :tasting_rooms
  has_many :wineries, through: :tasting_rooms

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
end
