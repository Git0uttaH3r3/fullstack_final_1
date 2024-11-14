class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :lego_set

  validates :order_id, presence: true
  validates :lego_set_id, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price_at_purchase, presence: true, numericality: { greater_than: 0 }
end
