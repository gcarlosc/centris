class CreateSkus < ActiveRecord::Migration
  def change
    create_table :skus do |t|
      t.string :sku
      t.string :status
      t.belongs_to :product, index: true
      t.belongs_to :warehouse, index: true

      t.timestamps null: false
    end
  end
end
