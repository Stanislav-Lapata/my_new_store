class CategoriesController < ApplicationController
  before_action :set_categories, only: [:show, :edit, :update, :destroy]

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

    if @category.save
      redirect_to root_url
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to @category
      flash[:notice] = "Category updated"
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      redirect_to root_url
    else
      redirect_to @category
      flash[:notice] = 'Сan not be removed, have owned products'
    end
  end

  private

  def set_categories
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
