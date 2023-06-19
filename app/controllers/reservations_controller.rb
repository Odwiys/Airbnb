class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @listing = Listing.find(params[:listing_id])
  end

  def create
    @reservation = Reservation.new
    reservation.user = current_user
  end
end
