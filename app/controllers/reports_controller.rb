class ReportsController < ApplicationController
  def order_supplier_report
    @orders = Order.select("suppliers.name as supplier_name").joins(:supplier).order("suppliers.name").where("orders.order_date >= 2022-01-01")
    render :layout => false
  end

  def product_order_report
    @products = Products.select("products.name as product_name, sum(orders.quantity) as total_quantity").joins(:product).group("products.name").order("total_quantity desc")
    render :layout => false
  end

  def product_brand_report
    @products = Product.select("products.name, brands.name").joins(:brand).order("products.name")
    render :layout => false
  end
end
