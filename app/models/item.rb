class Item < ApplicationRecord
  has_and_belongs_to_many :lists
  belongs_to :location, optional: true

  def to_s
    if name.blank?
      'missing name'
    else
      name
    end
  end

end
