class CreateListItems < ActiveRecord::Migration[5.1]
  def change
    create_table :list_items do |t|
      t.belongs_to :list, null: false, index: true
      t.belongs_to :item, null: false, index: true
      t.timestamps
    end
  end
end
