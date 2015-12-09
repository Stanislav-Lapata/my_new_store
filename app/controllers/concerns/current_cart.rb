module CurrentCart

  private

  def set_cart
    if @cart = Cart.find_by(id: session[:cart_id])
      @cart
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
end
