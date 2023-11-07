class Bookmark < ApplicationRecord
    belongs_to :user
    belongs_to :problem
    
    # one user can bookmark only one time
    validates :user_id, uniqueness: { scope: :problem_id}
end
