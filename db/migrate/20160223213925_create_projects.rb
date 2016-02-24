class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :address
      t.belongs_to :organization

      t.timestamps null: false
    end
  end
end
