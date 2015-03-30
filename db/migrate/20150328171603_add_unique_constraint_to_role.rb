class AddUniqueConstraintToRole < ActiveRecord::Migration
  def change
	execute <<-SQL
      ALTER TABLE roles
        ADD CONSTRAINT unique_role
          UNIQUE (role);
    SQL
  end
end
