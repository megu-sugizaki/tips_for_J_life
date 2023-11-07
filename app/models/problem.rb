class Problem < ApplicationRecord
    has_many :association_problem_tags, dependent: :destroy
    has_many :problem_tags, through: :association_problem_tags
    belongs_to :user
    has_many :problem_comments, dependent: :destroy
    has_many :bookmarks, dependent: :destroy
    has_many :bookmark_problems, through: :bookmarks, source: :problem
    has_many_attached :problem_images
    
    def self.search(keyword, tag_id)
        # By "left_outer_joins", search from the outer-joined code with problem_tags
        # ref: https://qiita.com/kurokawa516/items/5ffcfebed09e0d49bf43
        if keyword.blank?
            # When keyword NOT inserted, search only by tag
            left_outer_joins(:problem_tags).where("problem_tags.id = ?", tag_id.to_i)
        else
            # When keyword inserted, search by keyword and tag
            left_outer_joins(:problem_tags).where("title LIKE ? OR caption LIKE ? OR problem_tags.id = ?", "%#{keyword}%", "%#{keyword}%", tag_id.to_i)
        end
    end 
    
    def bookmarked_by?(user)
        bookmarks.where(user_id: user).exists?
    end 
end
