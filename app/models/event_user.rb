class EventUser < ApplicationRecord
  # M:Indent fixed
  belongs_to :user
  belongs_to :event
end
