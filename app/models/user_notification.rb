class UserNotification < ActiveRecord::Base
  attr_accessible :from_user_id, :message, :read_status, :to_user_id
end
