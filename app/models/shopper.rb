class Shopper < ApplicationRecord
  belongs_to :order

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :nif, presence: true, uniqueness: true
end
