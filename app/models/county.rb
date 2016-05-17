class County < ApplicationRecord
  attachment :profile_image
  has_many :regions
  has_many :wineries, through: :regions
end
