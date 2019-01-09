module Karatekit
  class Client

    # Methods for the Posts API
    #
    # @see https://...
    module Posts

      # List posts
      #
      # @return [Array<Sawyer::Resource>] An array of hashes representing posts
      # @see https://...
      def posts(options = {})
        paginate "posts", options
      end

      # Get a single post
      #
      # @param id [Integer] ID of the post
      # @return [Sawyer::Resource] A single post
      # @see https://...
      def post(id, options = {})
        get "posts/#{id}", options
      end
    end
  end
end
