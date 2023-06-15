class RemoveTotalCostFromReservations < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :total_cost
  end
end
