class Event < ApplicationRecord
  has_many :event_users
  has_many :users, through: :event_users
  belongs_to :owner, class_name: 'User'
  
  validates :title, presence: true
  validates :caption, presence: true
  
  def is_owned_by?(user)
    owner.id == user.id
  end 
end
