class CategoryProduct < ActiveRecord::Base
  has_many :products
end
