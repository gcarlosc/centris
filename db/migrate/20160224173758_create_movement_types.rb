class CreateMovementTypes < ActiveRecord::Migration
  def change
    create_table :movement_types do |t|
      t.string :name
      t.string :factor

      t.timestamps null: false
    end
  end
end
