module Karatekit
  class Client

    # Methods for the EventParts API
    #
    # @see https://...
    module EventParts

      # List event_parts
      #
      # @return [Array<Sawyer::Resource>] An array of hashes representing event_parts
      # @see https://...
      def event_parts(options = {})
        paginate "event_parts", options
      end

      # Get a single event_part
      #
      # @param id [Integer] ID of the event_part
      # @return [Sawyer::Resource] A single event_part
      # @see https://...
      def event_part(id, options = {})
        get "event_parts/#{id}", options
      end
    end
  end
end
