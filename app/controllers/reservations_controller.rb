class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show approve reject]

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
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

  def approve
    @reservation = Reservation.find(params[:id])
    @reservation.status = true
    if @reservation.save
      redirect_to hosting_upcoming_path
    else
      render 'hosting', status: :unprocessable_entity
    end
  end

  def upcoming
    @reservations = Reservation.all.where('reservations.status.where = ?', true)
  end

  def reject
    @reservation = Reservation.find(params[:id])
    @reservation.status = false
    @reservation.save
    redirect_to hosting_path
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to hosting_path, notice: "Reservation deleted successfully."
  end


  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
