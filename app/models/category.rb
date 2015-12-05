class Category < ActiveRecord::Base
  has_many :products

  validates :name, :description, presence: true, uniqueness: true

  before_destroy :if_there_is_no_product_category

  private

  def if_there_is_no_product_category
    if products.empty?
      return true
    else
      errors.add(:base, 'There related products')
      return false
    end
  end
end
