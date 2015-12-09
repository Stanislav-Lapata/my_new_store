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

  def current_cart
    @cart = session[:cart_id]
  end
end
