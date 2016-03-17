class CreateSuscriptions < ActiveRecord::Migration
  def change
    create_table :suscriptions do |t|
      t.string :fullname
      t.string :email
      t.string :phone
      t.string :organization

      t.timestamps null: false
    end
  end
end
