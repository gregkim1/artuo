class Collab < ApplicationRecord
  # Direct associations

  belongs_to :art,
             :class_name => "Artwork",
             :foreign_key => "artwork_id"

  belongs_to :artist,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end
