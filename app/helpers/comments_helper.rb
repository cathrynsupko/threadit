module CommentsHelper
  
  def must_be_user(comment)
    rediret_to posts_path unless comment.user == current_user
  end
end
