class DeleteItemListJoinTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :items_lists
  end
end
