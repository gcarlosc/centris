class AddStatusToSku < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE TYPE statussku AS ENUM ('active', 'inactive', 'borrowed');
    SQL

    remove_column :skus, :status, :string
    add_column :skus, :status, :statussku, index: true, default: 'active'
  end

  def down
    remove_column :skus, :status
    add_column :skus, :status, :string

    execute <<-SQL
      DROP TYPE statussku;
    SQL
  end
end
