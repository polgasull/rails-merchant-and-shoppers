class AddSequraComissionToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :sequra_comission, :float
  end
end
