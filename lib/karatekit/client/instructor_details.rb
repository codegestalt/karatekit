module Karatekit
  class Client

    # Methods for the InstructorDetails API
    #
    # @see https://...
    module InstructorDetails

      # List instructor_details
      #
      # @return [Array<Sawyer::Resource>] An array of hashes representing instructor_details
      # @see https://...
      def instructor_details(options = {})
        paginate "instructor_details", options
      end

      # Get a single instructor_detail
      #
      # @param id [Integer] ID of the instructor_detail
      # @return [Sawyer::Resource] A single instructor_detail
      # @see https://...
      def instructor_detail(id, options = {})
        get "instructor_details/#{id}", options
      end
    end
  end
end
