class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :organization_name
      t.string :web
      t.string :subdomain

      t.timestamps null: false
    end
  end
end
