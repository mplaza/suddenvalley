class Topic
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :content, type: String
  has_many :posts
  belongs_to :tag
  has_many :votes
  belongs_to :user
  validates_presence_of :title


end
