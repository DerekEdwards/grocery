class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name,  null: false
      t.text :description
      t.integer :order
      t.timestamps
    end
  end
end
