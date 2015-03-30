class AddForeignkeyConstraintsToUserNotificationsTable < ActiveRecord::Migration
  def change
  	execute <<-SQL
      ALTER TABLE user_notifications
        ADD CONSTRAINT user_notifications_from_user_id_fk
          FOREIGN KEY (from_user_id) REFERENCES users(id);
    SQL
    execute <<-SQL
      ALTER TABLE user_notifications
        ADD CONSTRAINT user_notifications_to_user_id_fk
          FOREIGN KEY (to_user_id) REFERENCES users(id);
    SQL
  end
end
