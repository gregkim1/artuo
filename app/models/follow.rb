class Follow < ApplicationRecord
  # Direct associations

  belongs_to :artist,
             :class_name => "User",
             :foreign_key => "followed_id"

  belongs_to :user,
             :foreign_key => "follower_id",
             :counter_cache => true

  # Indirect associations

  # Validations

end
