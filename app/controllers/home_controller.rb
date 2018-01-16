class HomeController < ApplicationController
  	def index
	  	@message = Message.new
	  	@rooms = Room.all
  	end
end
