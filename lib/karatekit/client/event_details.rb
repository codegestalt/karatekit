module Karatekit
  class Client

    # Methods for the EventDetails API
    #
    # @see https://...
    module EventDetails

      # List event_details
      #
      # @return [Array<Sawyer::Resource>] An array of hashes representing event_details
      # @see https://...
      def event_details(options = {})
        paginate "event_details", options
      end

      # Get a single event_detail
      #
      # @param id [Integer] ID of the event_detail
      # @return [Sawyer::Resource] A single event_detail
      # @see https://...
      def event_detail(id, options = {})
        get "event_details/#{id}", options
      end
    end
  end
end
