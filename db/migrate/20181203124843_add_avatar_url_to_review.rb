class AddAvatarUrlToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :avatar_url, :string
  end
end
