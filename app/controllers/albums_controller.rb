class AlbumsController < ApplicationController
  def show
    @album = Album.find_by_url(params[:url])
    @user = @album.user
    @photos = @album.photos.paginate(page: params[:page], :per_page => 12)
  end

  def destroy
    @album = Album.find(params[:id])
    @user = @album.user
    @album.destroy
    redirect_to username_path(@user.username)
  end
end