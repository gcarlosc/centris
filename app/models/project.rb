class Project < ActiveRecord::Base

  before_save { |project| project.name.downcase! }

  has_many :warehouses, foreign_key: :project_id

  belongs_to :organization
  has_many :warehouses
end
