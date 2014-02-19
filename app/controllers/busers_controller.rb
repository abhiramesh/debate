class BusersController < ApplicationController

	def create
		@buser = Buser.create(params["buser"])
		respond_to do |format|
	      format.js
	  	end
	end
end
