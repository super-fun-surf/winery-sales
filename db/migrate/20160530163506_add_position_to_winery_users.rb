class AddPositionToWineryUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :winery_users, :position, :string
  end
end
