class ProblemTag < ApplicationRecord
    has_many :association_problem_tags, dependent: :destroy
    has_many :problems, through: :association_problem_tags
end
