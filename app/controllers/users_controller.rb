class UsersController < ApplicationController
	def show
	 	@user = User.find(params[:id])
  		if current_user.id != @user.id 
  			redirect_to current_user
  		end
  	end
  	def current_user_home
  		redirect_to current_user
	end

	def photos
		@photos = "photos"
	end

	def songs
		@songs = current_user.songs.sort_by {|x| [x.artist, x.album] }
	end

	def movies
		@movies = "movies"
	end
end