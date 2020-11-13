class OrdersController < ApplicationController
  def index
    @orders_completed = Order.completed
    json_response(@orders_completed)
  end
end