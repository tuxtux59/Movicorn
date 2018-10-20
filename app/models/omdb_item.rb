class OmdbItem < ApplicationRecord

  validates :title, uniqueness: true
  has_one_attached :poster
end
