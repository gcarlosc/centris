class Supplier < ActiveRecord::Base
  has_many :in_guides, as: :originable, class_name: 'Guide'
  has_many :out_guides, as: :destinable, class_name: 'Guide'
end
