class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :restaurant, foreign_key: true
      t.string :name
      t.integer :original_price
      t.integer :discount
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.datetime :start_day
      t.datetime :end_day
      t.string :image

      t.timestamps
    end
  end
end
