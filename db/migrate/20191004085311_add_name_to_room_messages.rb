class AddNameToRoomMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :room_messages, :name, :string
  end
end
