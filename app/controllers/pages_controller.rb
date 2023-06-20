class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @listings = Listing.all
  end

  def hosting
    @user = current_user
    # @reservations = Reservation.joins(:listing).where('listings.user_id = ?', current_user.id)
    @reservations = Reservation.joins(:listing).where('listings.user_id = ? AND reservations.status IS NULL', @user.id)
  end

  def upcoming
    @user = current_user
    @reservations = Reservation.joins(:listing).where('listings.user_id = ?', current_user.id)
  end
end
