class PhotosController < ApplicationController
	def create
		@photo = Photo.new(params[:photo])
		@photo.user_id = current_user.id
		@photo.save
		redirect_to username_path(current_user.username)
	end

	def go
		@photo = Photo.find_by_short_url(params[:short_url])
		redirect_to @photo.url, :status => 307
	end
end