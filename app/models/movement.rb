class Movement < ActiveRecord::Base

  enum status: {
    pending: 0,
    saved: 1
  }

  has_many :items, dependent: :destroy
  has_many :skus, through: :items, dependent: :destroy

  accepts_nested_attributes_for :items, allow_destroy: true
  accepts_nested_attributes_for :skus, allow_destroy: true
  belongs_to :movement_type

  validates :creator_id, presence: true
  validates :responsable_id, presence: true
  validates :movement_type_id, presence: true
  validates :originable_id, presence: true
  validates :originable_type, presence: true
  validates :destinable_id, presence: true
  validates :destinable_type, presence: true

  belongs_to :originable, polymorphic: true
  belongs_to :destinable, polymorphic: true
  belongs_to :creator, class_name: 'User'

  def change_warehouse
    self.skus.each do |sku|
      sku.update_attribute( :warehouse_id, self.destinable_id )
    end
  end

  def change_status(skus)
    case self.movement_type_id
      when 3
        Sku.where(id: skus).update_all(status: 'borrowed')
      when 4
        Sku.where(id: skus).update_all(status: 'active')
      when 5
        Sku.where(id: skus).update_all(status: 'inactive')
    end
  end
end
