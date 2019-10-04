class RoomsController < ApplicationController
	before_action :load_entities

	def index
		@rooms = Room.all
	end

	def new
		@room = Room.new
	end

	def create
		@room = Room.new permitted_parameters

		if @room.save
			flash[:success] = "Room #{@room.name} was created"
			redirect_to rooms_path
		else
			render :new
		end
	end

	def update
		if @room.update_attributes(permitted_parameters)
			flash[:success] = "Room #{@room.name} was updated"
			redirect_to rooms_path
		else
			render :new
		end
	end

	def show
  		@room_message = RoomMessage.new room: @room
  		@room_messages = @room.room_messages
  		@random_guest_name = "Guest #{(0...8).map { (65 + rand(26)).chr }.join}"
	end

	protected

	def load_entities
		@rooms = Room.all
		@room = Room.find(params[:id]) if params[:id]
	end

	def permitted_parameters
		params.require(:room).permit(:name)
	end
end
