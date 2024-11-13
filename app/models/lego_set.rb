class LegoSet < ApplicationRecord
  has_many :reviews
  has_many :order_items

  def self.ransackable_attributes(auth_object = nil)
    ["id", "lego_set_id", "name", "review", "rating", "created_at", "updated_at"]
  end
end

