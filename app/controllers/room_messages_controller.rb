class RoomMessagesController < ApplicationController
	before_action :load_entities

	def create
		@room_message = RoomMessage.create room: @room,
										   name: params.dig(:room_message, :name),
										   message: params.dig(:room_message, :message)
	end

	protected

	def load_entities
		@room = Room.find params.dig(:room_message, :room_id)
	end
end
