class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :address
      t.string :logo
      t.string :web

      t.timestamps null: false
    end
  end
end
