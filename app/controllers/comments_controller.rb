class CommentsController < ApplicationController
  
  
  def create
    @reply = Comment.new
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      respond_to do |format|
        format.js
      end
    else
      redirect_to posts_path
    end  
  end
  
  def destroy
    @id = params[:id]
    Comment.find_by(id: @id).destroy
    respond_to do |format|
      format.js
    end
  end
  
  def like
    @comment = Comment.find_by(id: params[:id])
    @comment.likes += 1
    if @comment.save
      respond_to do |format|
        format.js
      end
    else
      redirect_to posts_path
    end
    
  end
  
  def dislike
    @comment = Comment.find_by(id: params[:id])
    @comment.dislikes += 1
    if @comment.save
      respond_to do |format|
        format.js
      end
    else
      redirect_to posts_path
    end
  end
  
  
  private
    def comment_params
      params.require(:comment).permit(:content, :post_id, :parent_id)
    end
end
