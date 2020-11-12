class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.decimal :amount
      t.datetime :completed_at

      t.timestamps
    end
  end
end
