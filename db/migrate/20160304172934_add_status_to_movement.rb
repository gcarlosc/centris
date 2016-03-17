class AddStatusToMovement < ActiveRecord::Migration
  def change
    remove_column :movements, :status, :string
    add_column :movements, :status, :integer, default: 0
  end
end
