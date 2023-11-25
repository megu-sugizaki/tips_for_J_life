class ProblemTag < ApplicationRecord
  # M:Indent fixed
  has_many :association_problem_tags
  has_many :problems, through: :association_problem_tags
  belongs_to :user
  # M:To show delete button only to the user that made the tag
  
  validates :name, presence: true
end
