class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items

  validates :customer_id, presence: true
  validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :status, presence: true, inclusion: { in: %w[pending shipped completed canceled] }
  #validates :created_at, presence: true


  def self.ransackable_attributes(auth_object = nil)
    ["id", "customer_id", "total_price", "status", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["customer", "order_items"]
  end
end
