class Order < ApplicationRecord
  belongs_to :supplier
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :total, presence: true, numericality: { greater_than: 0 }
  validates :order_date, presence: true
  validates :product_id, presence: true
  validates :supplier_id, presence: true
end
