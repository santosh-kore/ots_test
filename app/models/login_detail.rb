class LoginDetail < ActiveRecord::Base
  attr_accessible :is_logged_in, :password, :role_id, :user_id, :user_login_id
  belongs_to :user
  belongs_to :role
end
