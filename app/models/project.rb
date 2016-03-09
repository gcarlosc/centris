class Project < ActiveRecord::Base

  before_save { |project| project.name.downcase! }

  validates :name, presence: true
  validates :address, presence: true
  validates :code, presence: true, uniqueness: true

  has_many :warehouses, foreign_key: :project_id

  belongs_to :organization
  has_many :warehouses
end
