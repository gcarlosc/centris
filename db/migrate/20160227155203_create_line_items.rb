class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.belongs_to :product, index: true, foreign_key: true
      t.belongs_to :movement, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
