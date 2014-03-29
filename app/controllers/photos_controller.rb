class PhotosController < ApplicationController  
  def create
    images = params[:photo][:url].split(',')

    if images.length == 1
      photo         = Photo.new
      photo.url     = images[0]
      photo.user_id = current_user.id if current_user
      photo.save
      flash[:notice] = "Uploaded photo as a guest" unless current_user

      redirect_to photo_url_path(photo.short_url)
    elsif images.length > 1
      album = Album.new

      images.each do |image|
        photo         = Photo.new
        photo.url     = image
        photo.user_id = current_user.id if current_user
        photo.save
        album.photos << photo
      end

      album.user_id = current_user.id if current_user
      album.save
      flash[:notice] = "Uploaded album as a guest" unless current_user

      redirect_to album_url_path(album.url)
    else
      flash[:notice] = "Something went wrong. No files were uploaded."

      redirect_to root_path
    end
  end

  def show
    return no_photo if no_photo?(params[:short_url])

    @photo = Photo.find_by_short_url(params[:short_url])
    @user = @photo.user if @photo.user
  end

  def go
    return no_photo if no_photo?(params[:short_url])

    @photo = Photo.find_by_short_url(params[:short_url])

    redirect_to @photo.url, :status => 301
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    render json: {}
  end
end