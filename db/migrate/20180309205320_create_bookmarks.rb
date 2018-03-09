class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.integer :artwork_id
      t.integer :folder_id

      t.timestamps

    end
  end
end
