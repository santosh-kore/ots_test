class AddUserStatusColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_status, :string, null: false, default: "Approved"
  end
end
