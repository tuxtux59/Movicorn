module OmdbApi
  attr_reader :rest_client

  def self.omdb_client
    return @rest_client unless @rest_client.blank?
    RestClient.log = 'stdout'
    apiUrl = 'http://www.omdbapi.com/'
    @rest_client = RestClient::Resource.new(apiUrl)
  end
end

module OmdbApi
  class Search
    require 'nokogiri'
    API_KEY = '?apikey=f032e0a4'

    def self.item_by_title(title)
      result = JSON.parse OmdbApi.omdb_client[API_KEY].get({params:{t: title}})
      if result.present? && result.is_a?(JSON)
        OmdbItem.create(result)
      end
      return result
    end
  end
end