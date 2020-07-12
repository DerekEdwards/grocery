class RenameStatusToActive < ActiveRecord::Migration[5.1]
  def change
    rename_column :lists, :status, :active
  end
end
