class Problem < ApplicationRecord
    has_many :association_problem_tags, dependent: :destroy
    has_many :problem_tags, through: :association_problem_tags
    belongs_to :user
    has_many :problem_comments, dependent: :destroy
    has_many_attached :problem_images
    
    def self.search(keyword)
        where("facility_name LIKE ? or address LIKE ? or detailed_description LIKE ?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%")
    end 
end
