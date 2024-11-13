class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :lego_set
end
