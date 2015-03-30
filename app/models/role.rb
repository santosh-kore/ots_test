class Role < ActiveRecord::Base
  attr_accessible :role
  has_many :users
  has_many :login_deatils
end
