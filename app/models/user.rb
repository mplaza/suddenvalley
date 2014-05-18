require "bcrypt"
class User
  include Mongoid::Document
  field :email, type: String
  field :password_digest, type: String
  field :notoffending, type: Boolean
  has_many :posts
  has_one :profile

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  validates_length_of :password, minimum: 6
  validates_inclusion_of :notoffending, :in => [true], message: ": You can't offending anyone here"

  def password
    @password
  end

  def password=(new_password)
    @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)
  end

  def authenticate(test_password)
    if BCrypt::Password.new(self.password_digest) == test_password
      self
    else
      false
    end
  end
end
