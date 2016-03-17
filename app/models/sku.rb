class Sku < ActiveRecord::Base

    enum status: {
    active: 0,
    inactive: 1,
    borrowed: 2
  }

  belongs_to :product
  belongs_to :warehouse

  has_many :items
  has_many :movements, through: :items

  accepts_nested_attributes_for :items, allow_destroy: true
  accepts_nested_attributes_for :movements, allow_destroy: true

  belongs_to :product, class_name: 'Product'

  validates :sku, presence: true, uniqueness: true
  validates :status, presence: true
  validates :product_id, presence: true

  scope :by_status, ->(sku_status) { where(status: sku_status) }
  scope :filtered_skus, -> (warehouse, product) { where(warehouse: warehouse, product: product) }
  scope :by_warehouse, ->(warehouse) { where(warehouse: warehouse) if warehouse.present? }
end
