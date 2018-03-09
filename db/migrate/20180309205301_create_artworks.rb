class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.text :caption
      t.string :image_url
      t.integer :edition
      t.integer :cost
      t.boolean :for_sale

      t.timestamps

    end
  end
end
