class PhotosController < ApplicationController
	def create
		@photo = Photo.new(params[:photo])
		@photo.url = params[:photo][:filepicker_url]
		@photo.save
		redirect_to root_path
	end
end