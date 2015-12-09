class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  def self.init_or_increment_quantity(product_id, cart_id)
    current_line_item  = self.find_by(product_id: product_id, cart_id: cart_id)
    if current_line_item
      current_line_item.quantity += 1
    else
      current_line_item = self.new(product_id: product_id, cart_id: cart_id)
    end
    current_line_item
  end

  def total_price
    product.price * quantity
  end
end
