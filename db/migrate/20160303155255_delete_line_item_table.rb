class DeleteLineItemTable < ActiveRecord::Migration
  def up
    drop_table :line_items
    add_column :skus, :movement_id, :integer
    add_index :skus, :movement_id
    add_foreign_key :skus, :movements
  end

  def down
    create_table :line_items do |t|
      t.integer :quantity
      t.belongs_to :product, index: true, foreign_key: true
      t.belongs_to :movement, index: true, foreign_key: true

      t.timestamps null: false
    end
    remove_column :skus, :movement_id
  end
end
