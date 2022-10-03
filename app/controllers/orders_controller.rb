class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  include AjaxModalRails::Controller

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to orders_url, notice: "Pedido adicionado com sucesso." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to orders_url, notice: "Pedido atualizado com sucesso." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    begin
      @order.destroy

      respond_to do |format|
        format.html { redirect_to orders_url, notice: "Pedido removido com sucesso." }
      end
    rescue ActiveRecord::InvalidForeignKey => e
      respond_to do |format|
        format.html { redirect_to orders_url, alert: "Não é possível remover um pedido que está sendo utilizado em um pedido." }
      end
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:quantity, :total, :order_date, :product_id, :supplier_id)
    end
end
