class Item < ApplicationRecord
  has_many :list_items
  has_many :lists, through: :list_items
  belongs_to :location, optional: true

  def to_s
    if name.blank?
      'missing name'
    else
      name
    end
  end

end
