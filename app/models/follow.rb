class Follow < ApplicationRecord
  # Direct associations

  belongs_to :artist,
             :class_name => "User"

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
