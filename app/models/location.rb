class Location < ApplicationRecord
  has_many :items

  scope :by_order, -> { order(order: :asc) }
end
