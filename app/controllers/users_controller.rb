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
end