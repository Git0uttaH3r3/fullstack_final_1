class Category < ApplicationRecord
  has_many :lego_sets
  validates :name, presence: true, uniqueness: true

  def self.ransackable_associations(auth_object = nil)
    ["lego_sets"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "name", "updated_at"]
  end
end