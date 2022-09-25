class AddPhoneToSupplier < ActiveRecord::Migration[5.2]
  def change
    add_column :suppliers, :phone, :string
  end
end
