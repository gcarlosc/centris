class Product < ActiveRecord::Base

  before_save { |product| product.name.downcase! }

  belongs_to :description
  belongs_to :category_product
  belongs_to :classification
  belongs_to :description
  belongs_to :unit
  has_many :line_items, dependent: :destroy
  has_many :skus, dependent: :destroy

  validates :name, presence: true
  validates :category_product_id, presence: true
  validates :description_id, presence: true
  validates :classification_id, presence: true

end
