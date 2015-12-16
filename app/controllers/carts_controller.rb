class CartsController < ApplicationController
  include ApplicationHelper

  before_action :set_cart, only: [:show, :destroy]

  def show
    @line_items = @cart.line_items.order('created_at desc')
  end

  def destroy
    @cart.destroy
    redirect_to root_url
  end
end
