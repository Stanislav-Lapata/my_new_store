class Product < ActiveRecord::Base
  belongs_to :category

  validates :title, :description, presence: true, uniqueness: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0.01}
end
