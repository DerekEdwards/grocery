class Store < ApplicationRecord

  has_many :locations

  def to_s
    name
  end

  # Make the store the default store
  def make_current
    Store.all.update(current: false)
    self.update(current: true)
  end

  # Get the Global Current Store
  def self.current_store
    Store.find_by(current: true)
  end
  
end
