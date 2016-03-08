class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :sku, index: true
      t.belongs_to :movement, index: true

      t.timestamps null: false
    end
    remove_column :skus, :movement_id, :integer
  end
end
