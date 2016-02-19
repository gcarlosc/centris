class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.string :brand
      t.string :sub_brand

      t.timestamps null: false
    end
  end
end
