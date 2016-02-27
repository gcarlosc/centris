class Supplier < ActiveRecord::Base

  before_save { |supplier| supplier.name.downcase! }

  has_many :in_movements, as: :originable, class_name: 'Movement'
  has_many :out_movements, as: :destinable, class_name: 'Movement'
end
