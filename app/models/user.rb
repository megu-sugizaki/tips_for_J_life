class User < ApplicationRecord
  # M:Indent fixed
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :problems, dependent: :destroy
  #has_many :problems, class_name: 'Problem', foreign_key: "user_id"
  
  #M:To show delete button only to the user that made the tag
  has_many :problem_tags
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_problems, through: :bookmarks, source: :problem
  has_many :problem_comments, dependent: :destroy
  has_many :event_users, dependent: :destroy
  has_many :events, through: :event_users
  has_many :my_events, class_name: 'Event', foreign_key: "owner_id", dependent: :destroy
  
  has_one_attached :profile_image
  
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  # M:Described in seed       
  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.first_name = "guestuser"
      user.last_name = "!"
      user.middle_name = ""
      user.id = 31
    end
  end
  
  def guest_user?
    email == "guest@example.com"
  end 
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/profile_image/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end
end
