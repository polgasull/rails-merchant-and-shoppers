class Shopper < ApplicationRecord
  has_many :orders, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :nif, presence: true, uniqueness: true
end
