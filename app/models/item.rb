class Item < ApplicationRecord
  has_many :list_items
  has_many :lists, through: :list_items
  belongs_to :location, optional: true

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

end
