class Sku < ActiveRecord::Base

  belongs_to :product
  belongs_to :warehouse
  belongs_to :line_item

  belongs_to :product, class_name: 'Product'
end
