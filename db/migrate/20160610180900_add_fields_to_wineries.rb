class AddFieldsToWineries < ActiveRecord::Migration[5.0]
  def change
    add_column :wineries, :cases_sold_2015, :integer
    add_column :wineries, :wine_club_members, :integer
  end
end
