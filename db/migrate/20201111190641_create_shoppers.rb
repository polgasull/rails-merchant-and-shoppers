class CreateShoppers < ActiveRecord::Migration[6.0]
  def change
    create_table :shoppers do |t|
      t.string :name
      t.string :email, null: false
      t.string :nif, null: false

      t.index :email, unique: true
      t.index :nif, unique: true
      t.timestamps
    end
  end
end
