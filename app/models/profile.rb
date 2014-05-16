class Profile
  include Mongoid::Document
  field :username, type: String
  field :location, type: String
  field :bio, type: String
  belongs_to :user
end
