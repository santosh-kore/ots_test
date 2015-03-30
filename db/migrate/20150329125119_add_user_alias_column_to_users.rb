class AddUserAliasColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_alias, :string, null: false
  end
end
