class CreateShares < ActiveRecord::Migration[7.1]
  def change
    create_table :shares do |t|
      t.string :title
      t.string :description
      t.float :price
      t.string :signature

      t.timestamps
    end
  end
end
