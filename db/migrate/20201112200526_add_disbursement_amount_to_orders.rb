class AddDisbursementAmountToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :disbursement_amount, :float
  end
end
