class Problem < ApplicationRecord
    has_many :association_problem_tags, dependent: :destroy
    has_many :problem_tags, through: :association_problem_tags
    belongs_to :user
    has_many :problem_comments, dependent: :destroy
    has_many_attached :problem_images
    
    def self.search(keyword, tag_id)
        # left_outer_joinsで、problem_tagsと外部結合したれコードから検索する
        # ref: https://qiita.com/kurokawa516/items/5ffcfebed09e0d49bf43
        if keyword.blank?
            # キーワードが指定されていなければ、タグのみで検索する
            left_outer_joins(:problem_tags).where("problem_tags.id = ?", tag_id.to_i)
        else
            # キーワードがあれば、タグも含めて検索する
            left_outer_joins(:problem_tags).where("title LIKE ? OR caption LIKE ? OR problem_tags.id = ?", "%#{keyword}%", "%#{keyword}%", tag_id.to_i)
        end
    end 
end
