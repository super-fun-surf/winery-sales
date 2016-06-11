class AddFieldsToTastingRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :tasting_rooms, :tasting_fee, :decimal, precision: 8, scale: 2
    add_column :tasting_rooms, :non_wine_sales_percent_of_room, :decimal, precision: 8, scale: 2
    add_column :tasting_rooms, :seated_tastings, :boolean, default: false
    remove_column :tasting_rooms, :num_of_employees, :integer
  end
end
