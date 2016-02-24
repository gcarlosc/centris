class Warehouse < ActiveRecord::Base
  belongs_to :project
  has_many :guides, as: :originable
  has_many :guides, as: :destinable
end
