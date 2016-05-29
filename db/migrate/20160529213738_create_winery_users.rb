class CreateWineryUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :winery_users do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :winery, foreign_key: true
      t.integer :permissions, default: 0

      t.timestamps
    end
  end
end
