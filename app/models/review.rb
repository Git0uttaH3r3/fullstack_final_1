class Review < ApplicationRecord
  belongs_to :lego_set

  validates :lego_set_id, presence: true
  validates :name, presence: true
  validates :review, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  def self.ransackable_associations(auth_object = nil)
    ["lego_sets"]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "id", "lego_set_id", "name", "review", "rating", "created_at", "updated_at"]
  end
end
