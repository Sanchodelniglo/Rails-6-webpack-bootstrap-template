module GooglePlacesApi
  class Retriever
    class << self
      def build
        new(api_key: default_key)
      end

      private

      def default_key
        ENV['GOOGLE_PLACES_API_KEY']
      end
    end

    attr_reader :client

    def initialize(api_key:)
      @client = GooglePlaces::Client.new(api_key)
    end

    def get_restaurants_around(coordinates)
      return nil if coordinates.compact.size != 2

      client.spots(coordinates.first, coordinates.last, types: %w[restaurant food bakery], exclude: %w[cafe], detail: true, radius: 200)
    end
  end


end