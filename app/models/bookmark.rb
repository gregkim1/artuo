class Bookmark < ApplicationRecord
  # Direct associations

  belongs_to :folder,
             :required => false

  belongs_to :artwork

  # Indirect associations

  # Validations

end
