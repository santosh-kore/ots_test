class VideoClass < ActiveRecord::Base
  attr_accessible :class_name
  has_many :categories
end
