class ChangeEndTimeToBeTimeInPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :end_time, :time
    change_column :posts, :start_time, :time
  end
end
