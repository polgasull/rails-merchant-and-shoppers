class CreateMerchants < ActiveRecord::Migration[6.0]
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :email, null: false
      t.string :cif, null: false

      t.index :email, unique: true
      t.index :cif, unique: true
      t.timestamps
    end
  end
end
