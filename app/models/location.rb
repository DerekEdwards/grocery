class Location < ApplicationRecord
  has_many :items
  belongs_to :store

  scope :by_order, -> { order(order: :asc) }
end
