class AddLocationToItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :items, :location, index: true
  end
end
