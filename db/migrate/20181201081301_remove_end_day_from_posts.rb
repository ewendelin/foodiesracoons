class RemoveEndDayFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :end_day, :datatime
  end
end
