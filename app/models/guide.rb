class Guide < ActiveRecord::Base
  belongs_to :guiable, polymorphic: true
end
