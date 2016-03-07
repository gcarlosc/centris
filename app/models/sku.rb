class Sku < ActiveRecord::Base

  belongs_to :product
  belongs_to :warehouse
  belongs_to :movement

  belongs_to :product, class_name: 'Product'

  validates :sku, presence: true
  validates :status, presence: true
  validates :product_id, presence: true

  scope :by_statuses, ->(list_status) { where(status: list_status) }
end
