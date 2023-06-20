class AddReservationStatus < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :status, :boolean, default: nil
  end
end
