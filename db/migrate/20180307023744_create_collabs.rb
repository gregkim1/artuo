class CreateCollabs < ActiveRecord::Migration
  def change
    create_table :collabs do |t|
      t.integer :artwork_id
      t.integer :artist_id

      t.timestamps

    end
  end
end
