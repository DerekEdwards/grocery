class Item < ApplicationRecord
  has_many :list_items
  has_many :lists, through: :list_items
  has_many :item_locations
  has_many :locations, through: :item_locations

  #DEREK 
  scope :at_location, ->(location) { where(location: location) }

  scope :active, -> { where(active: true) }

  def to_s
    if name.blank?
      'missing name'
    else
      name
    end
  end

  def self.search search_string
    search_string = "%#{search_string}%"
    query = Item.arel_table[:name].matches(search_string)
    Item.where(query)
  end

  def self.topX num=10
    recent_lists = List.most_recent.limit(10)
    item_ids = ListItem.where(list: recent_lists).group('item_id').order('count(*) DESC').limit(num).pluck(:item_id)
    Item.where(id: item_ids).sort_by { |u| item_ids.index(u.id) }
  end

  def get_location store 
    self.locations.find_by(store: store)
  end

  def set_location new_location 
    current_location = get_location new_location.store
    if current_location #We are changing the location at this store
      item_location = self.item_locations.find_by(location: current_location)
    else # We are creating a location at this store
      item_location = ItemLocation.new(item: self)
    end
    item_location.location = new_location 
    item_location.save 
  end

  def unset_location store 
    bad_location = get_location store
    if bad_location 
      self.item_locations.find_by(location: bad_location).delete
    end
  end

end
