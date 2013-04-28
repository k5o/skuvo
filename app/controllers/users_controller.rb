class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@photos = Photos.where(user_id: params[:id])
	end
end