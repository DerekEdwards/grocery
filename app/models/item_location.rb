class ItemLocation < ApplicationRecord
  validates_presence_of :location, :item

  belongs_to :location
  belongs_to :item

end