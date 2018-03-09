class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :artwork_id
      t.integer :user_id

      t.timestamps

    end
  end
end