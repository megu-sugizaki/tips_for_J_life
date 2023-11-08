class AssociationProblemTag < ApplicationRecord
    belongs_to :problem
    belongs_to :problem_tag
end
