class ProblemTag < ApplicationRecord
    has_many :association_problem_tags
    has_many :problems, through: :association_problem_tags
    belongs_to :user
    # to show delete button only to the user that made the tag
end
