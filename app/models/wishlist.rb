class Wishlist < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :bookmarks

  validates :name, presence: true
end
