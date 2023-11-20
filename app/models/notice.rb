class Notice < ApplicationRecord
    belongs_to :admin
    
    validates :title, presence: true
    validates :caption, presence: true
end
