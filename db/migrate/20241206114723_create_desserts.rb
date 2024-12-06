class CreateDesserts < ActiveRecord::Migration[7.1]
  def change
    create_table :desserts do |t|
      t.string :title
      t.float :price

      t.timestamps
    end
  end
end
