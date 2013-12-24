class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.new params[:user]
		if @user.save
			redirect_to @user
		else
			render :new #call template view new
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			redirect_to @user
		else
			render :edit
		end
	end

	def destroy 
		@user = User.find(params[:id])
		redirect_to users_path if @user.destroy 		
	end

end