class Problem < ApplicationRecord
    belongs_to :user
    has_many_attached :problem_images
end
