class ReservationsController < ApplicationController
  # before_action :set_reservation, only: %i[show]

  def show
    @listing = Listing.find(params[listing_id])
    @reservations = listing.reservations
  end

  # private

  # def set_reservation
  #   @reservation = Reservation.find(params[:id])
  # end
end
