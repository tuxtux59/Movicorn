class OmdbItemFetchBannerJob < ApplicationJob
  queue_as :default

  def perform(omdb_item)
    omdb_item.fetch_banner
  end
end
