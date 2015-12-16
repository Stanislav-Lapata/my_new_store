module ApplicationHelper
  def admin?
    if user_signed_in?
      current_user.admin == true
    end
  end

  def category?
    @category && @category.id != nil
  end

  def in_stock_or_not_in_stock
    if @product.in_stock?
      'In stock'
    else
      'Not in stock'
    end
  end

  def set_cart
    if @cart = Cart.find_by(id: session[:cart_id])
      @cart
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end

  def product_rating(product)
    product.reviews.sum(:rating) / product.reviews.count
  end
end
