class SessionsController < ApplicationController
  
  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user
    else
      redirect_to posts_path
    end
  end
  
  def destroy
    log_out
    redirect_to posts_path
  end
  
end
