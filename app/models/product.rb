class Product < ActiveRecord::Base

  before_save { |product| product.name.downcase! }
  before_save { |product| product.code.upcase! }

  belongs_to :description
  belongs_to :category_product
  belongs_to :classification
  belongs_to :description
  belongs_to :unit
  has_many :items
  has_many :movements, through: :items
  has_many :skus
  has_many :warehouses, -> { distinct }, through: :skus, dependent: :destroy

  validates :name, presence: true
  validates :unit_id, presence: true
  validates :category_product_id, presence: true
  validates :description_id, presence: true
  validates :classification_id, presence: true
  validates :code, presence: true, uniqueness: true

  def stock(warehouse)
    skus.by_warehouse(warehouse).by_statuses([0, 1]).size
  end

end
