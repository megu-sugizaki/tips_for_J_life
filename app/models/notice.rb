class Notice < ApplicationRecord
    
    validates :title, presence: true
    validates :detail, presence: true
end
