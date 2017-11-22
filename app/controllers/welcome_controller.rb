class WelcomeController < ApplicationController

	def new
	end

	def index
		@users = User.all
	end

	def update
    # @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
    	render 'edit'
    end
  end

	def destroy
  	User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to '/'
  end

end
