class ProblemComment < ApplicationRecord
    belongs_to :user
    belongs_to :problem
end
