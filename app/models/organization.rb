class Organization < ActiveRecord::Base

  has_many :projects, foreign_key: :Organization_id

end
