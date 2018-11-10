class Poll < ApplicationRecord
  belongs_to :user
  belongs_to :omdb_item

  validates :note, :inclusion => { :in => 1..5 }
end
