class Poll < ApplicationRecord
  belongs_to :user
  belongs_to :omdb_item

  validates_presence_of :user, :omdb_item

  NOTE_RANGE = 1..5

  validates :note, :inclusion => { :in => NOTE_RANGE }
end
