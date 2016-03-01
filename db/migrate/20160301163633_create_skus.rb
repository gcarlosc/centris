class CreateSkus < ActiveRecord::Migration
  def change
    create_table :skus do |t|
      t.string :sku
      t.string :status
      t.belongs_to :product, index: true, foreign_key: true
      t.belongs_to :warehouse, index: true, foreign_key: true
      t.belongs_to :line_item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
