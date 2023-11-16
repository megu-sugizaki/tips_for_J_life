class ProblemComment < ApplicationRecord
    belongs_to :problem
    belongs_to :user
    
    validates :comment, presence: true
end
