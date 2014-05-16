class PostsController < ApplicationController
before_action :authenticate_user, :only => [:new, :create, :edit, :destroy]
before_action :check_right_user, :only =>[:edit, :destroy]

  def new
    @topic = Topic.find(params[:topic_id])
    @user = User.find(session[:remember_token])
    @post = @topic.posts.build
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.create(params.require(:post).permit(:title, :content, :topic_id, :user_id))
    if @post.save
      redirect_to topics_path
    else 
      render 'new'
    end
  end

  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])

  end

  def destroy
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    @post.destroy
    redirect_to topics_path
  end
  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :content, :topic_id))
      redirect_to topics_path
    end
  end
  def current_user
    @current_user ||= session[:remember_token] && User.find(session[:remember_token])
  end
   def authenticate_user
    if !current_user
      flash[:danger] = "Sorry buddy, log in."
      redirect_to new_sessions_path
    end
  end
  def which_user
    @current_user = User.find(session[:remember_token])
    @post = Post.find(params[:id])
    if @current_user.id == @post.user_id  
      return true
    else 
      return false
    end
  end
  def check_right_user
    if !which_user
      flash[:danger] = "You can only edit your own posts"
      redirect_to topics_path
    end
  end

end
