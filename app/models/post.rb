class Post
  include Mongoid::Document
  field :title, type: String
  field :content, type: String
  belongs_to :topic
  belongs_to :user

  validates_presence_of :title, :content
end
