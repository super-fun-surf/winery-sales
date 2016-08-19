class WineryUser < ApplicationRecord
  belongs_to :user
  belongs_to :winery
  attr_accessor :new_user_email, :new_user_name
end
