class ProblemComment < ApplicationRecord
  # M:Indent fixed
  belongs_to :problem
  belongs_to :user
  
  validates :comment, presence: true
end
