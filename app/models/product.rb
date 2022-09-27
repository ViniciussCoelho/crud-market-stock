class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category

  has_many :orders

  validates :name, presence: true, uniqueness: true
  validates :quantity, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :category_id, presence: true
  validates :brand_id, presence: true
end
