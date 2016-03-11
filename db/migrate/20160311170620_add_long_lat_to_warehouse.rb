class AddLongLatToWarehouse < ActiveRecord::Migration
  def change
    add_column :warehouses, :longitude, :float
    add_column :warehouses, :latitude, :float
  end
end
