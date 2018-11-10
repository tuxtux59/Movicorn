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

    def self.data_by_title(title)
      JSON.parse OmdbApi.omdb_client[API_KEY].get({params: {t: title}})
    end

    def self.item_by_title(title)
      begin
        db_results = OmdbItem.where("lower(title) = ?", title.downcase)
        if db_results.any?
          return db_results.first
        else
          result = data_by_title(title)
          if result.present? && result.is_a?(Hash) && result.keys.any?
            valid_keys = OmdbItem.column_names
            result2 = {}
            result.each_pair{|k,v| result2.merge!({k.downcase => v}) if valid_keys.include?(k.downcase)}
          end
          item = OmdbItem.create(result2) if result2.keys.any?
          if result.key?('Poster')
            file = open(result['Poster'])
            if file.present?
              item.poster.attach(io: file, filename: "#{item.title}.jpg")
            end
          else
            item.fetch_poster
          end
          return item
        end
        return result
      rescue => e
        puts e.message
      end
    end
  end
end