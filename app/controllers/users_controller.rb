class UsersController < ApplicationController

	def new
	end

	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to '/'
		else
			redirect_to '/signup'
		end
	end

	def edit
		 # User.find(params[:id]) == User.find(current_user.id)
	    @user = User.find(current_user.id)
		# else
		# 	flash[:notice] = "You are not allow to edit this user."
		# 	redirect_to "/"
		# end
  end

  def update
    # @user = User.find(params[:id])
    if @user.update(update_params)
      redirect_to @user
    else
    	render :edit
    end
  end

private
def user_params
	params.require(:user).permit(:first_name, :last_name, :address, :phone_number, :email, :password, :password_confirmation)
end

end
