class CreateMovements < ActiveRecord::Migration
  def change
    create_table :movements do |t|
      t.integer :creator_id
      t.integer :responsable_id
      t.string :status
      t.belongs_to :movement_type

      t.references :originable, polymorphic: true, index: true
      t.references :destinable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
