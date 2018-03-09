class Tag < ApplicationRecord
  # Direct associations

  has_many   :taggings,
             :dependent => :destroy

  # Indirect associations

  has_many   :artworks,
             :through => :taggings,
             :source => :artwork

  # Validations

end
