class SalesSummary < ApplicationRecord
  belongs_to :tasting_room

  def percent_tasters_purcahased
    num_of_purchasers.to_f / num_of_tasters.to_f * 100.0
  end
  def percent_club_signup
    num_of_club_signups.to_f / num_of_tasters.to_f * 100.0
  end
end
