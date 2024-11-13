class LegoSet < ApplicationRecord
  has_many :reviews
  has_many :order_items
end

