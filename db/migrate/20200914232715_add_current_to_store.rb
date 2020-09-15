class AddCurrentToStore < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :current, :boolean, default: false
  end
end
