class UsersController < ApplicationController
	
	def index
		@users = User.all
	end

	def show 
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.save
			log_in @user
			flash[:success] = "Tu es maintenant enregistré <3"
			redirect_to @user
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params[:id])
			redirect_tO @user
		else
			render 'edit'
		end
	end

	def destroy
		@user =  User.find(params[:id])
		@user.destroy
		redirect_to @user
	end

	private
	  def user_params
	  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
	  end
	
end
