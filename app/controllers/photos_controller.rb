class PhotosController < ApplicationController
	def create
		photo = Photo.new
		photo.url = params['image']
		photo.save
		redirect_to root_path
	end
end