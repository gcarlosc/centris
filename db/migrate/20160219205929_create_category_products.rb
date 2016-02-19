class CreateCategoryProducts < ActiveRecord::Migration
  def change
    create_table :category_products do |t|
      t.string :name
      t.integer :ancestry

      t.timestamps null: false
    end
  end
end
