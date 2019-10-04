class RemoveUser < ActiveRecord::Migration[6.0]
  def change
  	remove_column :room_messages, :user_id
  	drop_table :users
  end
end
