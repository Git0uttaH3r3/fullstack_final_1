class LegoSet < ApplicationRecord
  has_many :reviews
  has_many :order_items

  validates :set_id, presence: true, uniqueness: true
  validates :title, presence: true
  validates :image, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  def average_rating
    reviews.average(:rating).to_f.round(1) if reviews.any?
  end

  def self.ransackable_associations(auth_object = nil)
    ["reviews", "order_items"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "set_id", "title", "image", "price", "average_rating", "created_at", "updated_at"]
  end
end

