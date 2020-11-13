class Order < ApplicationRecord
  belongs_to :merchant
  belongs_to :shopper

  validates :amount, presence: true

  DISBURSE_LOW_TICKETS = 0.01.freeze
  DISBURSE_MID_TICKETS = 0.0095.freeze
  DISBURSE_HIGH_TICKETS = 0.0085.freeze

  scope :completed, -> { 
    where("completed_at IS NOT NULL") 
  }

  def self.disburse_orders
    orders = Order.completed
    orders.each do |order|
      order.update(
        disbursement_amount: calculate_disburse_amount(order.amount).round(2),
        sequra_comission: calculate_sequra_comission(order.amount).round(2)
      )
    end
  end

  def self.calculate_disburse_amount(amount)
    if amount < 50
      amount - (DISBURSE_LOW_TICKETS * amount)
    elsif amount.between?(50, 300)
      amount - (DISBURSE_MID_TICKETS * amount)
    else
      amount - (DISBURSE_HIGH_TICKETS * amount)
    end
  end

  def self.calculate_sequra_comission(amount)
    if amount < 50
      DISBURSE_LOW_TICKETS * amount
    elsif amount.between?(50, 300)
      DISBURSE_MID_TICKETS * amount
    else
      DISBURSE_HIGH_TICKETS * amount
    end
  end
end
