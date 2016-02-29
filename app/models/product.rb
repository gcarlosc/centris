class Product < ActiveRecord::Base

  before_save { |product| product.name.downcase! }

  belongs_to :description
  belongs_to :category_product
  belongs_to :classification
  belongs_to :description
  belongs_to :unit

end
