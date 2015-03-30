class CreateLoginDetails < ActiveRecord::Migration
  def change
    create_table :login_details do |t|
      t.integer :user_id, null:false
      t.string :user_login_id, null:false
      t.string :password, null:false
      t.boolean :is_logged_in, null:false
      t.integer :role_id, null:false

      t.timestamps
    end
  end
end
