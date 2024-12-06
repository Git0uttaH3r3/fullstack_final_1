class Customer < ApplicationRecord
  has_many :orders

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :address, presence: true
  validates :province, presence: true
  validates :password, presence: true

  before_validation :set_default_province, on: :create


  def set_default_province
    self.province ||= "MB"
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "email", "address", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["orders"]
  end
end
