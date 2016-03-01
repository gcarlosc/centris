class Sku < ActiveRecord::Base

  belongs_to :product
  belongs_to :warehouse
  belongs_to :line_item
end
