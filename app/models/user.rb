class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :customer, dependent: :destroy
  has_many :orders, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_validation :set_defaults, on: :create

  validates :name, presence: true
  validates :address, presence: true
  validates :province, presence: true

  private

  def set_defaults
    self.name ||= "Guest User"
    self.address ||= "Unknown Address"
    self.province ||= "MB"
  end
end
