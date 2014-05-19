class Tag
  include Mongoid::Document
  field :description, type: String
  has_many :topics
end
