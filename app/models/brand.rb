class Brand < ActiveRecord::Base
  belongs_to :product
  has_many :models
end
