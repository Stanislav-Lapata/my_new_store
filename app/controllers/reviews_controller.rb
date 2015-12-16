class ReviewsController < ApplicationController
  before_action :set_review, only: [:destroy]
  before_action :set_category, only: [:create, :destroy]

  def create
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]
    @review.user_id = current_user.id

    if @review.save
      redirect_to [@category, @review.product]
    else
      @product = @review.product
      render "products/show"
    end
  end

  def destroy
    @review.destroy

    redirect_to [@category, @review.product]
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def review_params
    params.require(:review).permit(:title, :description, :rating)
  end
end
