class Like < ApplicationRecord
  # Direct associations

  belongs_to :artwork,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
