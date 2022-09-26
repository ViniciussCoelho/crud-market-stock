class Product < ApplicationRecord
  belongs_to :category
  belongs_to :brand

  validates :name, presence: true, uniqueness: true
  validates :quantity, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates :brand_id, presence: true


end
