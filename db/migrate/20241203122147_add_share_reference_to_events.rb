class AddShareReferenceToEvents < ActiveRecord::Migration[7.1]
  def change
    add_reference :events, :share, null: false, foreign_key: true
  end
end
