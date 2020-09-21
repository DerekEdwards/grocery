class AddDefaultStoreToList < ActiveRecord::Migration[5.1]
  def change
    store = Store.first
    List.all.each do |list|
      list.store = store 
      list.save
    end
  end
end
