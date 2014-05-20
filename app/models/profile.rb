class Profile
  include Mongoid::Document
  include Mongoid::Paperclip
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
  has_mongoid_attached_file :image,
  	:default_url => ActionController::Base.helpers.asset_path('pedo_fam_guy.jpeg')

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
