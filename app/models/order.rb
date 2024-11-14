class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items

  validates :customer_id, presence: true
  validates :total_price, presence: true, numericality: { greater_than: 0 }
  validates :status, presence: true, inclusion: { in: %w[pending shipped completed canceled] }
  validates :created_at, presence: true
end
