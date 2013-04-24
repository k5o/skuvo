class PhotosController < ApplicationController
	def create
		@photo = Photo.new
		@photo.url = params['image']
		if @photo.save
			render 'success'
		else
			render 'error'
		end
	end
end