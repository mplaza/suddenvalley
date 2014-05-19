class Vote
  include Mongoid::Document
  belongs_to :topic
  has_one :user
  
end
