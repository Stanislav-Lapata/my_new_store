class Product < ActiveRecord::Base
  belongs_to :category
  has_many :images
  has_many :line_items
  has_many :reviews
  has_many :users, through: :reviews
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :title, :description, presence: true, uniqueness: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0.01}
end
