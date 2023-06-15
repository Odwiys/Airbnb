class Bookmark < ApplicationRecord
  belongs_to :wishlist, dependent: :destroy
  belongs_to :listing, dependent: :destroy
end
