module Karatekit
  class Client

    # Methods for the Instructors API
    #
    # @see https://...
    module Instructors

      # List instructors
      #
      # @return [Array<Sawyer::Resource>] An array of hashes representing instructors
      # @see https://...
      def instructors(options = {})
        paginate "instructors", options
      end

      # Get a single instructor
      #
      # @param id [Integer] ID of the instructor
      # @return [Sawyer::Resource] A single instructor
      # @see https://...
      def instructor(id, options = {})
        get "instructors/#{id}", options
      end
    end
  end
end
