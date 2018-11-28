class AddEverydayToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :everyday, :string
  end
end
