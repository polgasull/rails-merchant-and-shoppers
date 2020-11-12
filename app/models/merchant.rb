class Merchant < ApplicationRecord
  belongs_to :order

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :cif, presence: true, uniqueness: true
end
