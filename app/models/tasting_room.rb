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
end
