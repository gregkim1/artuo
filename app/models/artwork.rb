class Artwork < ApplicationRecord
  # Direct associations

  has_many   :collabs,
             :dependent => :destroy

  has_many   :taggings,
             :dependent => :destroy

  has_many   :ownerships,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
