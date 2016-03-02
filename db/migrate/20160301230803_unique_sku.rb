class UniqueSku < ActiveRecord::Migration
  def change
    add_index :skus, :sku, unique: true
  end
end
