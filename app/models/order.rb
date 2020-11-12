class Order < ApplicationRecord
  has_many :merchants, dependent: :destroy
  has_many :shoppers, dependent: :destroy

  validates :merchant_id, presence: true
  validates :shopper_id, presence: true
  validates :amount, presence: true
end
