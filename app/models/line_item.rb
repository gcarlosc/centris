class LineItem < ActiveRecord::Base

  validates :quantity, presence: true
  validates :movement_id, presence: true
  validates :product_id, presence: true

  belongs_to :product
  belongs_to :movement
  has_many :skus, dependent: :destroy

  def check_type
    if self.movement.movement_type_id == 1
      self.quantity.times do
        @sku = self.skus.create
        @sku.update_attribute(:product_id, self.product_id)
        @sku.update_attribute(:warehouse_id, self.movement.destinable_id)
      end
    end
  end

end
