class Location < ApplicationRecord
  has_many :items, through: :item_locations
  belongs_to :store

  scope :by_order, -> { order(order: :asc) }
end
