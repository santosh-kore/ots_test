class AddForeignkeyConstraintsToLoginDetailsTable < ActiveRecord::Migration
  def change
  	execute <<-SQL
      ALTER TABLE login_details
        ADD CONSTRAINT login_details_user_id_fk
          FOREIGN KEY (user_id) REFERENCES users(id);
    SQL
    execute <<-SQL
      ALTER TABLE login_details
        ADD CONSTRAINT login_details_role_id_fk
          FOREIGN KEY (role_id) REFERENCES roles(id);
    SQL
  end
end
