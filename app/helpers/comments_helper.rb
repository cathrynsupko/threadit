module CommentsHelper
  
  def must_be_user(comment)
    unless comment.user == current_user
      redirect_to posts_path
      flash[:alert] = "You are not authorized for this action"
    end
  end
end
