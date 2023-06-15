class AddUserReferenceToWishlist < ActiveRecord::Migration[7.0]
  def change
    add_reference :wishlists, :user
  end
end
