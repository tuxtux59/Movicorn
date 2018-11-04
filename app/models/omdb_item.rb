class OmdbItem < ApplicationRecord

  validates :title, uniqueness: true
  has_one_attached :poster
  has_one_attached :banner

  after_save :fetch_banner, if: -> {self.title.present? && !self.banner.attached?}
  def banner_url
    self.banner.attached? ? self.banner : (self.poster.attached?  ? self.poster : 'movie_banner.jpg')
  end
  def fetch_banner
    banner_title = "movie banner #{self.title}"
    url = QwantApi::Image.first(banner_title)
    return if url.nil? || url.empty?
    file = open(url)
    if file.present?
      self.banner.attach(io: file, filename: "#{banner_title.underscore}.jpg")
    end
  end
end
