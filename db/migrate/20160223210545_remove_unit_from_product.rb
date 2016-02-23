class RemoveUnitFromProduct < ActiveRecord::Migration
  def change
    remove_column :products,:unit
  end
end
