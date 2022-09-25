json.extract! product, :id, :name, :quantity, :expiration_date, :price, :category_id, :brand_id, :created_at, :updated_at
json.url product_url(product, format: :json)
