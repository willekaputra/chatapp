class AddUserIdToRoomMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :room_messages, :user_id, :integer
  end
end
