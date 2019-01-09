module Karatekit
  class Client

    # Methods for the InstructorGroups API
    #
    # @see https://...
    module InstructorGroups

      # List instructor_groups
      #
      # @return [Array<Sawyer::Resource>] An array of hashes representing instructor_groups
      # @see https://...
      def instructor_groups(options = {})
        paginate "instructor_groups", options
      end

      # Get a single instructor_group
      #
      # @param id [Integer] ID of the instructor_group
      # @return [Sawyer::Resource] A single instructor_group
      # @see https://...
      def instructor_group(id, options = {})
        get "instructor_groups/#{id}", options
      end
    end
  end
end
