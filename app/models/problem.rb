class Problem < ApplicationRecord
  # M:Indent fixed
  has_many :association_problem_tags, dependent: :destroy
  has_many :problem_tags, through: :association_problem_tags
  belongs_to :user
  has_many :problem_comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_users, through: :bookmarks, source: :user
  has_many_attached :problem_images
  
  validates :title, presence: true
  validates :caption, presence: true
    
  def self.search(keyword, tag_id, is_going)
    # M:By "left_outer_joins", search from the outer-joined code with problem_tags
    # M:ref: https://qiita.com/kurokawa516/items/5ffcfebed09e0d49bf43
    if keyword.blank?
      if is_going.present?
        # M:When keyword and is_going are NOT inserted, search only by tag and is_going
        left_outer_joins(:problem_tags).where("problem_tags.id=? OR is_going = ?", tag_id.to_i, is_going)
      else
        # M:When keyword is NOT inserted, search only by tag
        left_outer_joins(:problem_tags).where("problem_tags.id = ?", tag_id.to_i)
      end
    else
      if is_going.present?
        # M:When keyword and is_going are inserted, search by keyword, tag, and is_going
        left_outer_joins(:problem_tags).where("title LIKE? OR caption LIKE? OR problem_tags.id = ? OR is_going = ?", "%#{keyword}%","%#{keyword}%", tag_id.to_i, is_going)
      else
        # M:When keyword is inserted, search by keyword and tag
        left_outer_joins(:problem_tags).where("title LIKE ? OR caption LIKE ? OR problem_tags.id = ?", "%#{keyword}%", "%#{keyword}%", tag_id.to_i)
      end
    end
  end 
  
  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end 
end
