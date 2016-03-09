class AddCodeToProject < ActiveRecord::Migration
  def change
    add_column :projects, :code, :string, unique: true
  end
end
