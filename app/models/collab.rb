class Collab < ApplicationRecord
  # Direct associations

  belongs_to :artist,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end
