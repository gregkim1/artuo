class Artwork < ApplicationRecord
  # Direct associations

  has_many   :likes,
             :dependent => :nullify

  has_many   :bookmarks

  has_many   :collabs,
             :class_name => "Creation",
             :dependent => :destroy

  has_many   :taggings,
             :dependent => :destroy

  has_many   :ownerships,
             :dependent => :destroy

  # Indirect associations

  has_many   :tags,
             :through => :taggings,
             :source => :tag

  has_many   :users,
             :through => :ownerships,
             :source => :user

  # Validations

end
