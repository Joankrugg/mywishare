class CreateEventStarters < ActiveRecord::Migration[7.1]
  def change
    create_table :event_starters do |t|
      t.references :event, null: false, foreign_key: true
      t.references :starter, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
