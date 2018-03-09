class User < ApplicationRecord
  # Direct associations

  has_many   :past_ownerships,
             :class_name => "Ownership",
             :foreign_key => "seller_id",
             :dependent => :destroy

  has_many   :likes,
             :dependent => :nullify

  has_many   :folders,
             :dependent => :destroy

  has_many   :following,
             :class_name => "Follow",
             :foreign_key => "followed_id",
             :dependent => :destroy

  has_many   :follows,
             :foreign_key => "follower_id",
             :dependent => :destroy

  has_many   :collabs,
             :class_name => "Creation",
             :foreign_key => "artist_id"

  has_many   :ownerships

  # Indirect associations

  has_many   :buyers,
             :through => :past_ownerships,
             :source => :user

  has_many   :sellers,
             :through => :ownerships,
             :source => :seller

  has_many   :followers,
             :through => :following,
             :source => :user

  has_many   :followed_artists,
             :through => :follows,
             :source => :artist

  has_many   :artworks,
             :through => :ownerships,
             :source => :artwork

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
