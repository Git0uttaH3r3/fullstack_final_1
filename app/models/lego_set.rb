class LegoSet < ApplicationRecord
  has_many :reviews
  has_many :order_items
  belongs_to :category

  validates :set_id, presence: true, uniqueness: true
  validates :title, presence: true
  validates :image, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :category, presence: true

  def average_rating
    reviews.average(:rating).to_f.round(1) if reviews.any?
  end

  def self.ransackable_associations(auth_object = nil)
    ["reviews", "order_items"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "set_id", "title", "image", "price", "description", "category", "average_rating", "created_at", "updated_at"]
  end
end

