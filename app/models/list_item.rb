class ListItem < ApplicationRecord
  validates_presence_of :list, :item

  belongs_to :list
  belongs_to :item
end
