class AddAttributesToSupplier < ActiveRecord::Migration
  def up
    add_column :suppliers, :contact_name, :string
    add_column :suppliers, :email, :string
    add_column :suppliers, :phone, :integer
  end

  def down
    remove_column :suppliers, :contact_name
    remove_column :suppliers, :email
    remove_column :suppliers, :phone
  end
end
