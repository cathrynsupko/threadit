module PostsHelper
  
  def must_log_in
    redirect_to posts_path unless logged_in?
    
  end
  
  def must_be_author(post)
    redirect_to posts_path unless post.author == current_user
  end
end
