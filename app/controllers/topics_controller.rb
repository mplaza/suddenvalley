class TopicsController < ApplicationController
  def index
    if params[:new_sorting] == "true"
      @topics = Topic.desc(:created_at)
    else 
      @topics = Topic.where(:created_at.gte => (Date.today - 5)).sort_by{|topic| topic.votes.size }.reverse
    end
  end

  def new
    @topic = Topic.new
    @tags = Tag.all
  end

  def create
    @topic = Topic.create(params.require(:topic).permit(:title, :content, :user_id, :tag_id))
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
    if @topic.update(params.require(:topic).permit(:title, :content, :user_id, :tag_id))
      redirect_to topics_path
    else
      render 'edit'
    end

  end
  def show
    @topic = Topic.find(params[:id])
    @posts = Post.where(:topic_id => @topic.id).where(:created_at.gte => (Date.today - 5)).sort_by{|post| post.postvotes.size }.reverse
    @votes = Vote.where(:topic_id => @topic.id)
    @tags = Tag.where(:id => @topic.tag_id)
  end

  def destroy
    @topic = Topic.find(params[:id])
  end

  def upvote
    @topic = Topic.find(params[:id])
    @topic.votes.create
    redirect_to topic_path(@topic)
  end

end
