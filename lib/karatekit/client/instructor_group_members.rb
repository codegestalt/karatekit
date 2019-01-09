module Karatekit
  class Client

    # Methods for the InstructorGroupMembers API
    #
    # @see https://...
    module InstructorGroupMembers

      # List instructor_group_members
      #
      # @return [Array<Sawyer::Resource>] An array of hashes representing instructor_group_members
      # @see https://...
      def instructor_group_members(options = {})
        paginate "instructor_group_members", options
      end

      # Get a single instructor_group_member
      #
      # @param id [Integer] ID of the instructor_group_member
      # @return [Sawyer::Resource] A single instructor_group_member
      # @see https://...
      def instructor_group_member(id, options = {})
        get "instructor_group_members/#{id}", options
      end
    end
  end
end
