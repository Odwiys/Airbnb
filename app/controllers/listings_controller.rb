class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show]

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new(params[:id])
    @listing.user = current_user
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
      redirect_to listings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:name, :location, :details, :price, images: [])
  end
end
