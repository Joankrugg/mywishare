class AddDateAndTimeSlotToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :date, :date
    add_column :events, :time_slot, :string
  end
end
