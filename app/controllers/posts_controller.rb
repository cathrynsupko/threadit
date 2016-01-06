class PostsController < ApplicationController
  before_action :must_log_in, only: [:new, :create, :edit, :update, :destroy]
 
  
  def index
    @recent = Post.all.order('created_at DESC')
    @popular = Post.all.order('votes DESC' )
    @user = User.new
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def show
    @reply = Comment.new
    @comment = Comment.new
    @post = Post.find(params[:id])
    @comments = @post.comments.order("created_at DESC")
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.votes = 0
    if @post.save
      redirect_to current_user
    else
      redirect_to posts_path
    end
  end
  
  def edit
    
    @post = Post.find_by(id: params[:id])
    must_be_author(@post)
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    must_be_author(@post)
    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end
  
  def destroy
    Post.find_by(params[:id]).destroy
    redirect_to posts_path
  end
  
  def upvote    
    @post = Post.find(params[:id])
    @post.votes ||= 0
    @post.votes += 1
    if @post.save
      respond_to do |format|
        format.js 
      end
    end
  end
  
  def downvote
    @post = Post.find(params[:id])
    @post.votes ||= 0
    @post.votes -= 1
    if @post.save
      respond_to do |format|
        format.html { redirect_to posts_path }
        format.js
      end
    end
  end
  
  def popular
    @popular = Post.all.order('votes DESC')
    respond_to do |format|
      format.js
    end
  end
  
  def recent
    @recent = Post.all.order('created_at DESC')
    respond_to do |format|
      format.js
    end
  end
  
  
  private
  
    def post_params
      params.require(:post).permit(:title, :body)
    end
    
   
    
    
end
