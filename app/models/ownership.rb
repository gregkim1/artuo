class Ownership < ApplicationRecord
  # Direct associations

  belongs_to :artwork

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
