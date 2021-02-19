class List < ApplicationRecord
  has_many :list_items
  has_many :items, through: :list_items
  has_many :item_locations, through: :items
  belongs_to :store
  
  #DEREK
  has_many :locations, through: :items

  scope :active, -> { where(active: true) }
  scope :most_recent, -> { order(created_at: :desc) }

  def add_item item
    self.items << item 
  end
  
end
