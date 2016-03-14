class AddStatusToSku < ActiveRecord::Migration
  def change
    remove_column :skus, :status, :string
    add_column :skus, :status, :integer, default: 0
  end
end
