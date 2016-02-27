class Warehouse < ActiveRecord::Base

  before_save :change_name
  validates :project_id, presence: true

  belongs_to :project
  has_many :in_movements, as: :originable, class_name: 'Movement'
  has_many :out_movements, as: :destinable, class_name: 'Movement'

  def change_name
    self.name = "#{self.project.name} - #{self.name}"
  end
end
