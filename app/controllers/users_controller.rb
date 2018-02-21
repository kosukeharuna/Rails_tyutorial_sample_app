class UsersController < ApplicationController
  def show
   @user = User.find(params[:id])
  end
  # => app/views/users/show.html.erb
  def new
   @user = User.new
  end
  
  def create
   @user = User.new(user_params)
   if @user.save # => validation
     log_in @user
    flash[:success] = "Welcome to the Sample App!"
    redirect_to @user
    # Sucess
   else
    # Failure
    render 'new'
   end
  end
   
    private
    
   def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
   end
end
