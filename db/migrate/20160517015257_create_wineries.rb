class CreateWineries < ActiveRecord::Migration[5.0]
  def change
    create_table :wineries do |t|
      t.string :name
      t.belongs_to :region, foreign_key: true
      t.integer :year_established
      t.integer :num_of_employees
      t.string :profile_image_id
      t.boolean :estate
      t.jsonb :reminder_days

      t.timestamps
    end
    add_index :wineries, :reminder_days, using: 'gin'
  end
end
