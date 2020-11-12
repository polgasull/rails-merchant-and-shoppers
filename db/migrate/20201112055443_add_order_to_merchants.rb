class AddOrderToMerchants < ActiveRecord::Migration[6.0]
  def change
    add_reference :merchants, :order, null: false, foreign_key: true
  end
end
