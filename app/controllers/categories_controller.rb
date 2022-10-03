class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  include AjaxModalRails::Controller


  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_url, notice: "Categoria adicionada com sucesso." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_url, notice: "Categoria atualizada com sucesso." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    begin
      @category.destroy

      respond_to do |format|
        format.html { redirect_to categories_url, notice: "Categoria removida com sucesso." }
      end
    rescue ActiveRecord::InvalidForeignKey => e
      respond_to do |format|
        format.html { redirect_to categories_url, alert: "Não é possível remover uma categoria que está sendo utilizada em um produto." }
      end
    end
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
