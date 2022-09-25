class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.decimal :total
      t.date :order_date
      t.references :product, foreign_key: true
      t.references :supplier, foreign_key: true

      t.timestamps
    end
  end
end
