module QwantApi
  attr_reader :rest_client

  def self.client
    return @rest_client unless @rest_client.blank?
    RestClient.log = 'stdout'
    apiUrl = 'https://api.qwant.com/egp/search/'
    @rest_client = RestClient::Resource.new(apiUrl)
  end
end
module QwantApi
  class Image
    def self.search(query, count = 20)
      JSON.parse QwantApi.client["images?count=#{count}&q=#{URI.encode(query)}"].get
    end

    def self.sample(query, count = 20)
      self.search(query, count).dig('data','result','items').sample.dig('media')
    end

    def self.first(query, count = 5)
      self.search(query, count).dig('data','result','items').first.dig('media')
    end
  end
end