class AddOrganizerToEvents < ActiveRecord::Migration[7.1]
  def change
    add_reference :events, :organizer, foreign_key: true
  end
end
