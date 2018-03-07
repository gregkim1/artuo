class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.text :caption
      t.string :image_url
      t.string :tag

      t.timestamps

    end
  end
end
