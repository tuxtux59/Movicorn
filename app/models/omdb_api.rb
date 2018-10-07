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
    require 'open-uri'
    API_KEY = '?apikey=f032e0a4'

    def self.item_by_title(title)
      result = JSON.parse OmdbApi.omdb_client[API_KEY].get({params:{t: title}})
      if result.present? && result.is_a?(Hash) && result.keys.any?
        valid_keys = OmdbItem.column_names
        result2 = {}
        result.each_pair do |k,v|
          if valid_keys.include?(k.downcase)
            result2.merge!({k.downcase => v})
          end
        end
        item = OmdbItem.create(result2) if result2.keys.any?
        if result.key?('Poster')
          file = open(result['Poster'])
          if file.present?
            item.poster.attach(io: file, filename: "#{item.title}.jpg")
          end
        end
        return item
      end
      return result
    end
  end
end