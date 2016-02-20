class Product < ActiveRecord::Base
  belongs_to :description
  belongs_to :category_products
  belongs_to :classification
end
