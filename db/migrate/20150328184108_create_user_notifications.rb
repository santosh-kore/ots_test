class CreateUserNotifications < ActiveRecord::Migration
  def change
    create_table :user_notifications do |t|
      t.integer :from_user_id
      t.integer :to_user_id
      t.text :message
      t.boolean :read_status

      t.timestamps
    end
  end
end
