class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :content, type: String
  belongs_to :topic
  belongs_to :user
  has_many :postvotes
  validates_presence_of :content
end
