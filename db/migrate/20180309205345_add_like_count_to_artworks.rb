class AddLikeCountToArtworks < ActiveRecord::Migration[5.0]
  def change
    add_column :artworks, :likes_count, :integer
  end
end
