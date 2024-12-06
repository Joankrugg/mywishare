class CreateEventDesserts < ActiveRecord::Migration[7.1]
  def change
    create_table :event_desserts do |t|
      t.references :event, null: false, foreign_key: true
      t.references :dessert, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
