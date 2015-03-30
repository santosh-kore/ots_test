class AddForeignKeyConstraintToUsersTable < ActiveRecord::Migration
  def change
  	execute <<-SQL
      ALTER TABLE users
        ADD CONSTRAINT users_role_id_fk
          FOREIGN KEY (role_id) REFERENCES roles(id);
    SQL
  end
end
