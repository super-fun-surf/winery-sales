class Winery < ApplicationRecord
  attachment :profile_image
  belongs_to :region
  has_one :county, through: :region
end
