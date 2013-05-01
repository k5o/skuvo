class PhotosController < ApplicationController
	def create
		images = params[:photo][:url].split(',')
		images.each do |image|
			photo = Photo.new
			photo.url = image
			photo.user_id = current_user.id
			photo.save
		end
		redirect_to username_path(current_user.username)
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