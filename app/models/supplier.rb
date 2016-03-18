class Supplier < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i

  before_save { |supplier| supplier.name.downcase! }

  validates :name, presence: true
  validates :address, presence: true
  validates :contact_name, presence: true
  validates :email, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }

  has_many :in_movements, as: :originable, class_name: 'Movement'
  has_many :out_movements, as: :destinable, class_name: 'Movement'
end
