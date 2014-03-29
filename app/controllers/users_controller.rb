class UsersController < ApplicationController
  def show
    return no_user if no_user?(params[:username])

    @user = User.find_by_username(params[:username])
    @albums = @user.albums
    @photos = @user.photos.paginate(page: params[:page], :per_page => 12)
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
end