class ChangeDiscountToBeFloatInPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :discount, :float
  end
end
