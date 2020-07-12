class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.string :name,  null: false
      t.boolean :status, null: false, default: true
      t.timestamps
    end
  end
end
