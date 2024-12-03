class CreateMainCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :main_courses do |t|
      t.string :name
      t.string :description
      t.float :price
      t.integer :number_of_guests
      t.datetime :arrival
      t.text :comment

      t.timestamps
    end
  end
end
