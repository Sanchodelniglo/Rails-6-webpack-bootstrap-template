module GooglePlacesApi
  class Retriever
    class << self
      def build
        new(api_key: default_key)
      end

      private

      def default_key
        'AIzaSyAKVQETXVt0StkwujEpdLezCnZdmPrXULo'
      end
    end

    attr_reader :client

    def initialize(api_key:)
      @client = GooglePlaces::Client.new(api_key)
    end

    def get_restaurants_around(coordinates)
      client.spots(coordinates.first, coordinates.last, types: %w[restaurant food], detail: true, radius: 200)
    end
  end
end