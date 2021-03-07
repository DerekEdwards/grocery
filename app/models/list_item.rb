class ListItem < ApplicationRecord
  validates_presence_of :list, :item

  belongs_to :list
  belongs_to :item

  scope :at_location, -> (location){
    joins(:item).merge(Item.at_location location)
  }
end