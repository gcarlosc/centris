class Movement < ActiveRecord::Base

  # has_many :line_items, dependent: :destroy
  has_many :skus, dependent: :destroy
  accepts_nested_attributes_for :skus, reject_if: :all_blank, allow_destroy: true
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
end
