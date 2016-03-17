class ChangePhoneToModels < ActiveRecord::Migration
  def up
    remove_column :suppliers, :phone, :integer
    remove_column :users, :phone, :integer
    add_column :suppliers, :phone, :string
    add_column :users, :phone, :string
  end

  def down
    add_column :suppliers, :phone, :integer
    add_column :users, :phone, :integer
    remove_column :suppliers, :phone, :string
    remove_column :users, :phone, :string
  end
end
