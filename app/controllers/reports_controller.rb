class ReportsController < ApplicationController
  def order_supplier_report
    @orders = Order.select("orders.*, suppliers.name as supplier_name, suppliers.phone as supplier_phone").joins(:supplier).where("orders.order_date >= '2022-01-01' and orders.order_date <= '2022-12-31'").order("suppliers.name")
  end

  def product_order_report
    @products = Products.select("products.name, sum(orders.quantity) as total_quantity").joins(:product).group("products.name").order("total_quantity desc")
  end

  def product_brand_report
    @products = Product.select("products.name, brands.name").joins(:brand).order("products.name")
  end
end
