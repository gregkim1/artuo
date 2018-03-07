class Tagging < ApplicationRecord
  # Direct associations

  belongs_to :tag,
             :counter_cache => true

  belongs_to :artwork

  # Indirect associations

  # Validations

end
