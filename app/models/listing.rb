class Listing < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many :bookmarks

  validates :name, presence: true
  validates :location, presence: true
  validates :details, presence: true
  validates :price, presence: true
end
