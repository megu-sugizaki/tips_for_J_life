class Contact < ApplicationRecord
  # M:Indent fixed
  validates :name, presence: true
  validates :content, presence: true
end
