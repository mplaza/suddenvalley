class Profile
  include Mongoid::Document
  # Include this after_commit so that paperclip doesn't freak out
  def self.after_commit(*args, &block)
     args.each do |arg|
     case arg[:on]
       when :destroy
         after_destroy &block
       end
     end
   end
  field :username, type: String
  field :location, type: String
  field :bio, type: String
  belongs_to :user

end
