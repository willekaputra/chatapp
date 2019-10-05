module ApplicationCable
  identified_by :current_user
  class Connection < ActionCable::Connection::Base
  	self.current_user = "1"
  end
end
