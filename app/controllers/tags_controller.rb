class TagsController < ApplicationController
  def show
  	@tag = Tag.find(params[:id])
  	@topics = Topic.where(:tag_id => @tag.id)
  end
end
