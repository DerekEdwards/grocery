class AddNoteToListItem < ActiveRecord::Migration[5.1]
  def change
    add_column :list_items, :note, :text
  end
end
