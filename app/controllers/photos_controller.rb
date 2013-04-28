class PhotosController < ApplicationController
	def create
		@photo = Photo.new(params[:photo])
		@photo.save
		redirect_to user_path(current_user)
	end

	def go
		@photo = Photo.find_by_short_url(params[:short_url])
		redirect_to @photo.url, :status => 307
	end
end