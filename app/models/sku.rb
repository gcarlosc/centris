class Sku < ActiveRecord::Base

  belongs_to :product
  belongs_to :warehouse

  has_many :items
  has_many :movements, through: :items

  accepts_nested_attributes_for :items, allow_destroy: true
  accepts_nested_attributes_for :movements, allow_destroy: true

  belongs_to :product, class_name: 'Product'

  validates :sku, presence: true
  validates :status, presence: true
  validates :product_id, presence: true

  scope :by_status, ->(sku_status) { where(status: sku_status) }
end
