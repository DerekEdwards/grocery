class Store < ApplicationRecord

  has_many :locations

  def to_s
    name
  end

  # Get the Global Current Store
  def self.current_store
    Store.find_by(current: true)
  end
  
end
