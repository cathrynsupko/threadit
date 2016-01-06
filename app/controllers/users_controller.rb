class UsersController < ApplicationController
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to @user
      flash[:notice] = "Your sign up was successful!"
    else
      redirect_to posts_path
    end
  end
  
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end
  
  def destroy
    User.find_by(id: params[:id]).destroy
    flash[:notice] = "User was successfully deleted"
    log_out
    redirect_to posts_path
  end
  
  
  private
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
