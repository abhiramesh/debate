class StaticPagesController < ApplicationController

	def home
		@buser = Buser.new
	end

end
