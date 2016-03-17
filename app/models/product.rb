class Product < ActiveRecord::Base

  before_save { |product| product.name.downcase! }

  has_many :skus
  has_many :warehouses, through: :skus, dependent: :destroy
  belongs_to :description
  belongs_to :category_product
  belongs_to :classification
  belongs_to :description
  belongs_to :unit
  has_many :items
  has_many :movements, through: :items

  validates :name, presence: true
  validates :unit_id, presence: true
  validates :category_product_id, presence: true
  validates :description_id, presence: true
  validates :classification_id, presence: true
  validates :code, presence: true, uniqueness: true

  def stock(warehouse)
    skus.by_warehouse(warehouse).by_status(['active', 'borrowed']).size
  end

end
