class Item < ApplicationRecord
  has_and_belongs_to_many :lists
  belongs_to :location, optional: true
end
