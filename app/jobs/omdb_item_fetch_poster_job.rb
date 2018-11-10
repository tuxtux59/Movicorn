class OmdbItemFetchPosterJob < ApplicationJob
  queue_as :default

  def perform(omdb_item)
    omdb_item.fetch_poster
  end
end
