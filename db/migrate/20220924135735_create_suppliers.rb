class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.string :name, null: false, limit: 30
      t.string :city, null: false, limit: 50

      t.timestamps
    end
  end
end
