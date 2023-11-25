class Bookmark < ApplicationRecord
  # M:Indent fixed
  belongs_to :user
  belongs_to :problem
  
  # M:one user can bookmark only one time
  validates :user_id, uniqueness: { scope: :problem_id}
end
