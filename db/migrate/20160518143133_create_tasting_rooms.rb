class CreateTastingRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :tasting_rooms do |t|
      t.string :name
      t.belongs_to :region, foreign_key: true
      t.belongs_to :winery, foreign_key: true
      t.integer :year_established
      t.integer :num_of_employees
      t.string :profile_image_id
      t.boolean :estate

      t.timestamps
    end
  end
end
