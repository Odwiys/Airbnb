class WishlistsController < ApplicationController
  before_action :set_wishlist, only: %i[new destroy]

  def new
  end

  def create
    @wishlist = Wishlist.new(wishlist_params)
    @wishlist.user = current_user
    if @wishlist.save
      redirect_to wishlists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def destroy
  #   @wishlist.destroy
  #     redirect_to wishlists_path
  # end

  private

  def set_wishlist
    @wishlist = Wishlist.new(params[:id])
  end

  def wishlist_params
    params.require(:wishlist).permit(:name)
  end
end
