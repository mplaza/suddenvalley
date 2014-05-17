class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.create(params.require(:topic).permit(:title))
    if @topic.save
      redirect_to topics_path
    else render 'new'
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(params.require(:topic).permit(:title))
      redirect_to topics_path
    else
      render 'edit'
    end

  end
  def show
    @topic = Topic.find(params[:id])
    @posts = Post.where(:topic_id => @topic.id)
    
    
  end

  def destroy
    @topic = Topic.find(params[:id])
  end
end
