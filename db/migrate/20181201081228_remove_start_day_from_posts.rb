class RemoveStartDayFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :start_day, :datatime
  end
end
