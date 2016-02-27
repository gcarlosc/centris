class Project < ActiveRecord::Base

  before_save { |project| project.name.downcase! }


  belongs_to :organization
  has_many :warehouses
end
