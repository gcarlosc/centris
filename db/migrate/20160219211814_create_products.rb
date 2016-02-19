class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :unit
      t.belongs_to :category_product
      t.belongs_to :description
      t.belongs_to :classification

      t.timestamps null: false
    end
  end
end
