module Karatekit
  class Client

    # Methods for the Products API
    #
    # @see https://...
    module Products

      # List products
      #
      # @return [Array<Sawyer::Resource>] An array of hashes representing products
      # @see https://...
      def products(options = {})
        paginate "products", options
      end

      # Get a single product
      #
      # @param id [Integer] ID of the product
      # @return [Sawyer::Resource] A single product
      # @see https://...
      def product(id, options = {})
        get "products/#{id}", options
      end
    end
  end
end
