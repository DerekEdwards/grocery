class List < ApplicationRecord
  has_and_belongs_to_many :items
  has_many :locations, through: :items

  scope :active, -> { where(active: true) }
end