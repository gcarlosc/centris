class UniqueSubdomain < ActiveRecord::Migration
  def change
    add_index :accounts, :subdomain, unique: true
  end
end
