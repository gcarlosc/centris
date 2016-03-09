class AddCodeToProduct < ActiveRecord::Migration
  def change
    add_column :products, :code, :string, unique: true
  end
end
