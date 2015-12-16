class LineItemsController < ApplicationController

  include ApplicationHelper

  before_action :set_cart, only: [:create, :increment, :decrement]

  def create
    product = Product.find(params[:product_id])
    @line_item = LineItem.init_or_increment_quantity(product.id, @cart.id)

    if @line_item.save
      redirect_to @line_item.cart
    else
    end
  end


  def increment
    @line_item = LineItem.find(params[:line_item_id])
    @line_item.quantity += 1
    @line_item.save
    respond_to do |format|
      format.js
    end
  end

  def decrement
    @line_item = LineItem.find(params[:line_item_id])
    if @line_item.quantity > 1
      @line_item.quantity -= 1
    else
      @line_item
    end
    @line_item.save
    respond_to do |format|
      format.js
    end

  end
end
