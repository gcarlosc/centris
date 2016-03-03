class Sku < ActiveRecord::Base

  belongs_to :product
  belongs_to :warehouse
  belongs_to :movement

  belongs_to :product, class_name: 'Product'

  validates :sku, presence: true
  validates :product_id, presence: true
end
