class AddNotNullConstraintToStarterId < ActiveRecord::Migration[7.1]
  def change
    change_column_null :event_starters, :starter_id, false
  end
end
