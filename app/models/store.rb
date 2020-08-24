class Store < ApplicationRecord

  has_many :locations

  def to_s
    name
  end
  
end
