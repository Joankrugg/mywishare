class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.integer :number_of_guests
      t.datetime :arrival
      t.text :comment

      t.timestamps
    end
  end
end
