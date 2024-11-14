class LegoSet < ApplicationRecord
  has_many :reviews
  has_many :order_items

  validates :set_id, presence: true, uniqueness: true
  validates :title, presence: true
  validates :image, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  def self.ransackable_attributes(auth_object = nil)
    ["id", "lego_set_id", "name", "review", "rating", "created_at", "updated_at"]
  end
end

