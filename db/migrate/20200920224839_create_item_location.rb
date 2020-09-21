class CreateItemLocation < ActiveRecord::Migration[5.1]
  def change
    create_table :item_locations do |t|
      t.belongs_to :location, null: false, index: true
      t.belongs_to :item, null: false, index: true
      t.timestamps
    end
  end
end
