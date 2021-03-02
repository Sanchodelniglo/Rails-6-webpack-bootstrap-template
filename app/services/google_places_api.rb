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

    attr_reader :client, :message

    def initialize(api_key:)
      @client = GooglePlaces::Client.new(api_key)
    end

    def build_restaurants(coordinates:, radius:)
      return "Impossible de géolocaliser l'addresse donnée" if coordinates.compact.size != 2

      data = get_restaurants_around(coordinates: coordinates, radius: radius)
      data.map do |restaurant|
        next unless params_present?(restaurant)

        Restaurant.new(
          name: restaurant.name,
          address: restaurant.formatted_address,
          place_id: restaurant.place_id,
          open: restaurant.opening_hours['open_now'],
          rating: restaurant.rating,
          cost: restaurant.price_level
        )
      end.compact
    end

    private

    def get_restaurants_around(coordinates:, radius:)
      return nil if coordinates.compact.size != 2

      client.spots(
        coordinates.first,
        coordinates.last,
        types: %w[restaurant food bakery],
        exclude: %w[cafe],
        detail: true,
        radius: radius.to_i
      )
    end

    def params_present?(data)
      data.name &&
        data.formatted_address &&
        data.place_id &&
        data.opening_hours &&
        data.rating &&
        data.price_level
    end
  end
end