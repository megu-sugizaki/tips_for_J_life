class Problem < ApplicationRecord
    belongs_to :user
    has_many :problem_comments, dependent: :destroy
    has_many :association_problem_tags, dependent: :destroy
    has_many :problem_tags, through: :association_prolem_tags
    has_many_attached :problem_images
end
