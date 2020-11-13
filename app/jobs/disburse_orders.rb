class DisburseOrders < ApplicationJob

  queue_as :default

  def perform
     Order.disburse_orders
  end
end