class AlbumsController < ApplicationController
	def show
		@album = Album.find_by_url(params[:url])
		@photos = @album.photos
		@user = @album.user
	end
end