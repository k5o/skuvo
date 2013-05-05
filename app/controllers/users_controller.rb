class UsersController < ApplicationController
	def show
		@user = User.find_by_username(params[:username])
		@albums = @user.albums
		@photos = @user.photos
	end

	def create
	  @user = User.new(params[:user])
  	if @user.save
  		session[:user_id] = @user.id
  		current_user = @user.id
  		flash[:notice] = "Signed up"
    	redirect_to root_url
  	else
    	render :new
  	end
	end

	def new
		@user = User.new
	end

	def test
		@user = User.find_by_username("panorama")
		@albums = @user.albums
		@photos = @user.photos
	end
end