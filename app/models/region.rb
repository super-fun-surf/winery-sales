class Region < ApplicationRecord
  attachment :profile_image
  belongs_to :county
  has_many :wineries
end
