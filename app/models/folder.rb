class Folder < ApplicationRecord
  # Direct associations

  has_many   :bookmarks

  belongs_to :user

  # Indirect associations

  # Validations

end
