class Winery < ApplicationRecord
  attachment :profile_image
  has_many :tasting_rooms
  has_many :regions, through: :tasting_rooms
  has_many :counties, through: :regions
end
