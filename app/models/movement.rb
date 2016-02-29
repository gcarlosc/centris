class Movement < ActiveRecord::Base

  has_many :line_items
  accepts_nested_attributes_for :line_items, allow_destroy: true

  belongs_to :originable, polymorphic: true
  belongs_to :destinable, polymorphic: true
  belongs_to :creator, class_name: 'User'
end
