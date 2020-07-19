class MoveListeItemData < ActiveRecord::Migration[5.1]

  class Item < ActiveRecord::Base
    has_and_belongs_to_many :lists
    has_many :list_items
    has_many :lists_tmp, through: :list_items, source: :list
  end

  class List < ActiveRecord::Base
    has_and_belongs_to_many :items
    has_many :list_items
    has_many :items_tmp, through: :list_items, source: :item
  end

  class ListItem < ActiveRecord::Base
    belongs_to :list
    belongs_to :item
  end

  def up
    Item.all.each do |item|
      item.lists_tmp = item.lists
    end
  end

  def down
  end

end
