module Karatekit
  class Client

    # Methods for the Locations API
    #
    # @see https://...
    module Locations

      # List locations
      #
      # @return [Array<Sawyer::Resource>] An array of hashes representing locations
      # @see https://...
      def locations(options = {})
        paginate "locations", options
      end

      # Get a single location
      #
      # @param id [Integer] ID of the location
      # @return [Sawyer::Resource] A single location
      # @see https://...
      def location(id, options = {})
        get "locations/#{id}", options
      end
    end
  end
end
