class Item < ActiveRecord::Base
  belongs_to :movement
  belongs_to :sku
end
