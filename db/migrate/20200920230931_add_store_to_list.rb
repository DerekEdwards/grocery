class AddStoreToList < ActiveRecord::Migration[5.1]
  def change
    add_reference :lists, :store, index: true
  end
end
