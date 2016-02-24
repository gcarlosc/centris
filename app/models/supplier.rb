class Supplier < ActiveRecord::Base
  has_many :guides, as: :originable
  has_many :guides, as: :destinable
end
