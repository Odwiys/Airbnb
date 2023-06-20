class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show new]

  def index
    @reservations = Reservation.all
  end

  def new
  end

  def create
    @reservation = Reservation.new(reservation_parms)
    @reservation.user = current_user
    if @reservation.save
      redirect_to reservations_path
    else
      render 'listings/show', status: :unprocessable_entity
    end
  end

  def show
    @reservations = listing.reservations
  end

  def hosting
    @reservation = Reservation.find(params[:id])
  end

  private

  def set_reservation
    @listing = Listing.find(params[:listing_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
