class ListingsController < ApplicationController
  before_action :set_listings, only: %i[new show]

  def index
    @listings = Listing.all
  end

  def new
  end

  def create
    @listing = Listing.new(listings_params)
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

  def set_listings
    @listing = Listing.new(params[:id])
  end

  def listings_params
    params.require(:listing).permit(:name, :location, :details, :price)
  end
end
