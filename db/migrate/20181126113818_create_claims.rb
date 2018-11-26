class CreateClaims < ActiveRecord::Migration[5.2]
  def change
    create_table :claims do |t|
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true
      t.string :status
      t.timestamp :claimed_at

      t.timestamps
    end
  end
end
