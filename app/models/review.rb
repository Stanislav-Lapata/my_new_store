class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :title, :description, :rating, presence: true
end
