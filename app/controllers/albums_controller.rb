class AlbumsController < ApplicationController
	def show
		@album = Album.find_by_url(params[:url])
		@photos = @album.photos
		@user = @album.user
	end

	def destroy
		@album = Album.find(params[:id])
		@user = @album.user
		@album.destroy
		redirect_to username_path(@user.username)
	end
end