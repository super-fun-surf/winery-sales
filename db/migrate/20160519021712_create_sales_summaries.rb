class CreateSalesSummaries < ActiveRecord::Migration[5.0]
  def change
    create_table :sales_summaries do |t|
      t.belongs_to :tasting_room, foreign_key: true
      t.integer :num_of_tasters
      t.integer :num_of_purchasers
      t.integer :num_of_club_signups
      t.decimal :sales_in_dollars, precision: 8, scale: 2
      t.integer :year
      t.integer :month
      t.integer :day

      t.timestamps
    end
  end
end
