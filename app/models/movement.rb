class Movement < ActiveRecord::Base
  belongs_to :originable, polymorphic: true
  belongs_to :destinable, polymorphic: true
end
