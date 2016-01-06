module PostsHelper
  
  def must_log_in
    unless logged_in?
      redirect_to posts_path
      flash[:alert] = "You must be logged in to continue"
    end
    
  end
  
  def must_be_author(post)
    unless post.author == current_user
      redirect_to post_path(post)
      flash[:alert] = "You are not authorized for this action"
    end
  end
end
