class AddDataToItemLocation < ActiveRecord::Migration[5.1]
  class Item < ActiveRecord::Base
    belongs_to :location
  end

  class Location < ActiveRecord::Base
    has_many :items
  end

  class ItemLocation < ActiveRecord::Base
    belongs_to :location
    belongs_to :item
  end

  def up
    Item.all.each do |item|
      ItemLocation.create(item: item, location: item.location)
    end
  end

  def down
  end
end
