class BrandsController < ApplicationController
  before_action :set_brand, only: %i[ show edit update destroy ]

  include AjaxModalRails::Controller

  def index
    @brands = Brand.all
  end

  def show
  end

  def new
    @brand = Brand.new
  end

  def edit
  end

  def create
    @brand = Brand.new(brand_params)

    respond_to do |format|
      if @brand.save
        format.html { redirect_to brands_url, notice: "Marca adicionada com sucesso." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @brand.update(brand_params)
        format.html { redirect_to brands_url, notice: "Marca atualizada com sucesso." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    begin
      @brand.destroy

      respond_to do |format|
        format.html { redirect_to brands_url, notice: "Marca removida com sucesso." }
      end
    rescue ActiveRecord::InvalidForeignKey => e
      respond_to do |format|
        format.html { redirect_to brands_url, alert: "Não é possível remover uma marca que está sendo utilizada em um produto." }
      end
    end
  end

  private
    def set_brand
      @brand = Brand.find(params[:id])
    end

    def brand_params
      params.require(:brand).permit(:name)
    end
end
