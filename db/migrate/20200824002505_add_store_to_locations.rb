class AddStoreToLocations < ActiveRecord::Migration[5.1]
  def change
    add_reference :locations, :store, foreign_key: true
  end
end
