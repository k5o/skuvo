class UsersController < ApplicationController
	def show
		@user = User.find_by_username(params[:username])
		# @user = User.find(params[:id])
		@photos = Photo.where(user_id: params[:id])
	end

	def create
	  @user = User.new(params[:user])
  	if @user.save
    	redirect_to root_url, :notice => "Signed up!"
  	else
    	render 'static_pages/index'
  	end
	end
end