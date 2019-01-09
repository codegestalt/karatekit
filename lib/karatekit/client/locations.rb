module Karatekit
  class Client

    # Methods for the Locations API
    #
    # @see https://developer.github.com/v3/repos/commits/
    module Locations

      # List commits
      #
      # @overload commits(repo, sha_or_branch, options = {})
      #   @deprecated
      #   @param repo [Integer, String, Hash, Repository] A GitHub repository
      #   @param sha_or_branch [String] A commit SHA or branch name
      #   @param options [String] :sha Commit SHA or branch name from which to start the list
      # @overload commits(repo, options = {})
      #   @param repo [Integer, String, Hash, Repository] A GitHub repository
      #   @param options [String] :sha Commit SHA or branch name from which to start the list
      # @return [Array<Sawyer::Resource>] An array of hashes representing commits
      # @see https://developer.github.com/v3/repos/commits/#list-commits-on-a-repository
      def locations(options = {})
        paginate "locations", options
      end

      # Get a single commit
      #
      # @param repo [Integer, String, Hash, Repository] A GitHub repository
      # @param sha [String] The SHA of the commit to fetch
      # @return [Sawyer::Resource] A hash representing the commit
      # @see https://developer.github.com/v3/repos/commits/#get-a-single-commit
      def location(id, options = {})
        get "locations/#{id}", options
      end
    end
  end
end
