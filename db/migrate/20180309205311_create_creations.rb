class CreateCreations < ActiveRecord::Migration
  def change
    create_table :creations do |t|
      t.integer :artwork_id
      t.integer :artist_id
      t.string :share

      t.timestamps

    end
  end
end
