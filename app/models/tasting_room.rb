class TastingRoom < ApplicationRecord
  attachment :profile_image
  belongs_to :region
  belongs_to :winery
  has_many :sales_summaries
end
