module Karatekit
  module Models
    class Base
      attr_accessor :attributes
      attr_reader :karatekit_client

      def initialize(attrs, opts = {})
        @models = {}
        @attributes = attrs.dup
        @karatekit_client = opts[:client] || Karatekit::Client.new(opts)
      end

      def self.attributed(*attribute_names)
        attribute_names.each do |attribute_name|
          define_method(attribute_name) do
            @attributes[__method__.to_s]
          end
        end
      end

      def self.modeled(opts = {})
        opts.each do |attribute_name, model|
          attribute_name_string = attribute_name.to_s
          Karatekit::Models::Base.send :define_method, attribute_name_string do
            @models[attribute_name_string] ||= model.new(@attributes[attribute_name_string] || {}, client: karatekit_client)
          end
        end
      end

      def to_hash
        @attributes
      end

      def fetch
        self.class.new(@karatekit_client.get(path), client: @karatekit_client)
      end

      # Retrieves an instance of the object by ID
      #
      # @param id [Integer] the id of the object to retrieve
      # @param opts [Hash] options to pass along to the `Karatekit::Client`
      #   instance
      def self.get(id, opts = {})
        client = opts[:client] || Karatekit::Client.new(opts)
        self.new({ 'id' => id }, opts).fetch
      end
    end
  end
end