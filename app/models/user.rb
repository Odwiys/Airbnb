class User < ApplicationRecord
  has_many :wishlists
  has_many :listings
  has_many :bookmarks, through: :listings
  has_many :reservations

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :phone_number, presence: true, uniqueness: true
end
