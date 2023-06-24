class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new 
    @post= Post.new(author: current_user)
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_posts_path(user_id: current_user.id), notice: 'Post created successfully.'
    else
      render :new
    end
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
