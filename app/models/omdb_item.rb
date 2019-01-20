class OmdbItem < ApplicationRecord

  validates :title, uniqueness: true
  has_many :polls

  after_save :fetch_banner, if: -> {self.title.present? && !self.banner.attached?}


  def update_ref_id
    return if self.title.blank?
    ref_id = OmdbApi::Search.data_by_title(self.title).dig('imdbID')
    self.update_column(:ref_id, ref_id) if ref_id.present?
  end

  def dates
    pattern = 'D_MIN_'
    ENV.keys.select{|k| k.starts_with?(pattern)}.map do |key|
      date = self.released.nil? ? ENV[key].to_i.months.from_now : self.released + ENV[key].to_i.months
      {
          in_future: Date.today <= date,
          date: date,
          key: key.gsub(pattern, '').downcase
      }
    end
  end

  def status
    min = self.dates.min{|d| d.dig(:date)}.dig(:date)
    max = self.dates.max{|d| d.dig(:date)}.dig(:date)
    now = Date.today
    {
        key: now < min ? 'before' : (now < max) ? 'between' : 'after',
        position: now < min ? -1 : (now < max) ? 0 : 1
    }
  end

  def fetch_banner
    banner_title = "movie banner #{self.title}"
    url = QwantApi::Image.first(banner_title)
    return if url.nil? || url.empty?
    self.update_attributes!(banner_url: url)
  end

  def fetch_poster
    poster_title = "movie poster #{self.title}"
    url = QwantApi::Image.first(poster_title)
    return if url.nil? || url.empty?
    self.update_attributes!(poster_url: url)
  end

  def fetch_banner_async
    begin
      OmdbItemFetchBannerJob.perform_now self
    rescue
      puts 'error'
    end
  end

  def fetch_poster_async
    begin
      OmdbItemFetchPosterJob.perform_now self
    rescue
      puts 'error'
    end
  end

  def udate_ref_id_async
    begin
      OmdbItemUpdateRefIdJob.perform_now self
    rescue
      puts 'error'
    end
  end

  def simple_update_async
    self.fetch_banner
    self.fetch_poster
  end

  def update_async
    self.update_ref_id
    self.fetch_banner
    self.fetch_poster
  end

  def next
    self.class.where("id > ?", id).first
  end

  def prev
    self.class.where("id < ?", id).last
  end

  def first?
    self.class.first == self
  end
  
  def last?
    self.class.last == self
  end
end
