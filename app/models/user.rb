class User < ApplicationRecord
  # Direct associations

  has_many   :follows,
             :dependent => :destroy

  has_many   :collabs,
             :foreign_key => "artist_id"

  has_many   :ownerships

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
