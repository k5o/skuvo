class UsersController < ApplicationController
	def show
		@user = User.find_by_username(params[:username])
		@photos = @user.photos
	end

	def create
	  @user = User.new(params[:user])
  	if @user.save
  		session[:user_id] = @user.id
  		current_user = @user.id
    	redirect_to root_url, :notice => "Signed up!"
  	else
    	render 'static_pages/index'
  	end
	end
end