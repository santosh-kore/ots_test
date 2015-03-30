class ChangeColumnsToNotNullForNotficationsTable < ActiveRecord::Migration
  def change
  	change_column_null :user_notifications, :from_user_id, false
  	change_column_null :user_notifications, :to_user_id, false
  	change_column_null :user_notifications, :message, false
  	change_column_null :user_notifications, :read_status, false
  	change_column_default :user_notifications, :read_status, false
  end
end
