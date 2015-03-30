class User < ActiveRecord::Base
  attr_accessible :address, :city, :country, :date_of_birth, :email, :name, :phone, :role_id, :sex, :specialization, :user_alias
  has_one :role
  has_many :user_category_mappings
  has_one :login_detail
end
