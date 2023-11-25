class Notice < ApplicationRecord
  # M:Indent fixed
  validates :title, presence: true
  validates :detail, presence: true
end
