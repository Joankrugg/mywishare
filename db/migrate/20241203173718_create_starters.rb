class CreateStarters < ActiveRecord::Migration[7.1]
  def change
    create_table :starters do |t|
      t.string :title
      t.float :price

      t.timestamps
    end
  end
end
