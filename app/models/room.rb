class Room < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :capacity
end
