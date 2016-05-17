class CreateCounties < ActiveRecord::Migration[5.0]
  def change
    create_table :counties do |t|
      t.string :name
      t.integer :population
      t.string :profile_image_id

      t.timestamps
    end
  end
end
