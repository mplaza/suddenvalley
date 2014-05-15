class PostsController < ApplicationController

  def new
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build

  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.create(params.require(:post).permit(:title, :content, :topic_id))
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
end
