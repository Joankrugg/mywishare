class AddNotNullConstraintToDessertId < ActiveRecord::Migration[7.1]
  def change
    change_column_null :event_desserts, :dessert_id, false
  end
end
