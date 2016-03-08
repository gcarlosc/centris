class AddStatusToMovement < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE TYPE status AS ENUM ('pending', 'saved');
    SQL

    remove_column :movements, :status
    add_column :movements, :status, :status, index: true, default: 'pending'
  end

  def down
    remove_column :movements, :status
    add_column :movements, :status, :string

    execute <<-SQL
      DROP TYPE status;
    SQL
  end
end
