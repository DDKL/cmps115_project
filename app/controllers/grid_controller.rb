class GridController < ApplicationController
	def show
		@user = User.find(params[:id])
		@n = 6
	end
end
