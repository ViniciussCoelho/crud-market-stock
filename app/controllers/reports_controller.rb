class ReportsController < ApplicationController
  def order_supplier_report
    @orders = Order.select("orders.*, suppliers.name as supplier_name, suppliers.phone as supplier_phone").joins(:supplier).where("orders.order_date >= '2022-01-01' and orders.order_date <= '2022-12-31'").order("suppliers.name")
  end

  def product_order_report
    @products = Product.select("products.name, orders.quantity as order_quantity, orders.order_date as order_date").joins(:orders)
  end

  def product_brand_report
    @products = Product.select("products.name, brands.name as brand_name").joins(:brand).order("products.name")
  end
end
