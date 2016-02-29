class Description < ActiveRecord::Base

  before_save { |description| description.brand.downcase!}
  before_save { |description| description.sub_brand.downcase! }
  before_save { |product| product.name.downcase! }

  has_many :products
end
