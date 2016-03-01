class LineItem < ActiveRecord::Base

  validates :quantity, presence: true
  validates :movement_id, presence: true
  validates :product_id, presence: true

  belongs_to :product
  belongs_to :movement
  has_many :skus
end
