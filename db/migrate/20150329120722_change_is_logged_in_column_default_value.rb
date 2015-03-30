class ChangeIsLoggedInColumnDefaultValue < ActiveRecord::Migration
  def change
  	change_column_default :login_details, :is_logged_in, false
  end
end
