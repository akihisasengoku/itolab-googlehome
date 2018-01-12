class HomeController < ApplicationController
  	def index
	  	@message = Message.new
	  	@places = [705, 701, 708]
  	end
end
