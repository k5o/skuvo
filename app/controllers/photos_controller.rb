class PhotosController < ApplicationController
	def create
		images = params[:photo][:url].split(',')
		if images.length == 1
			photo = Photo.new
			photo.url = images[0]
			photo.user_id = current_user.id if current_user
			photo.save
			flash[:notice] = "Uploaded photo as a guest" if !current_user
			redirect_to photo_url_path(photo.short_url)
		else
			album = Album.new
			images.each do |image|
				photo = Photo.new
				photo.url = image
				photo.user_id = current_user.id if current_user
				photo.save
				album.photos << photo
			end
			album.save
			flash[:notice] = "Uploaded album as a guest" if !current_user
			redirect_to album_url_path(album.url)
		end
	end

	def show
		@photo = Photo.find_by_short_url(params[:short_url])
	end

	def go
		@photo = Photo.find_by_short_url(params[:short_url])
		redirect_to @photo.url, :status => 307
	end

	def destroy
		@photo = Photo.find(params[:id])
		@photo.destroy
		render json: {}
	end
end