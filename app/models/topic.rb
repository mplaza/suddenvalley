class Topic
  include Mongoid::Document
  field :title, type: String
  has_many :posts

  validates_presence_of :title
  
end
