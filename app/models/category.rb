class Category < ActiveRecord::Base
  attr_accessible :active, :cat_name, :session_id, :session_url, :video_class_id
  belongs_to :video_class
  has_many :user_category_mappings
end
