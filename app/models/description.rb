class Description < ActiveRecord::Base

  before_save { |description| description.brand.downcase! }
  before_save { |description| description.sub_brand.downcase! }

  validates :brand, presence: true
  validates :sub_brand, presence: true
  has_many :products
end
