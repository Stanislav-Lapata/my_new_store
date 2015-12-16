class ProductsController < ApplicationController
  before_action :set_products, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:new, :show, :create, :edit, :update]

  def show
    @category = Category.find(params[:category_id])
    @review = @product.reviews.build(user_id: current_user.id)
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.category_id = params[:category_id]


    if @product.save
      redirect_to root_url
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @category
      flash[:notice] = "product updated"
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_url
    else
      render @product
    end
  end

  private

  def set_products
    @product = Product.find(params[:id])
  end

  def set_categories
    @category = Category.find(params[:category_id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :in_stock, images_attributes: [:id, :image, :_destroy])
  end
end
