class StoreImagesUrlsInsteadOfFilesToOmdbItems < ActiveRecord::Migration[5.2]
  def change
    add_column :omdb_items, :poster_url, :string
    add_column :omdb_items, :banner_url, :string

    OmdbItem.all.each do |item|
      banner_title = "movie banner #{item.title}"
      poster_title = "movie poster #{item.title}"
      banner_url = QwantApi::Image.first(banner_title)
      poster_url = QwantApi::Image.first(poster_title)
      if banner_url.present? && !banner_url.empty?
        item.update_attributes!(banner_url: banner_url)
        end
      if poster_url.present? && !poster_url.empty?
        item.update_attributes!(poster_url: poster_url)
      end
    end
  end
end
