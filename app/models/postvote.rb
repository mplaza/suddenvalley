class Postvote
  include Mongoid::Document
  belongs_to :post
  has_one :user

end
