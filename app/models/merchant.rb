class Merchant < ApplicationRecord
  has_many :orders, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :cif, presence: true, uniqueness: true
end
