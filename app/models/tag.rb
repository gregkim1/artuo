class Tag < ApplicationRecord
  # Direct associations

  has_many   :taggings,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
