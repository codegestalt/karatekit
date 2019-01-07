module Kampfsport
  module Models
    class Locations < KampfsportRecordCollection

      def initialize(attrs, query_opts = {}, opts = {})
        super(attrs.reject {|k,v| k == "locations" }, query_opts, opts)
        @entries = attrs["locations"].map do |entry|
          Location.new(entry, client: opts[:client])
        end
      end

      def fetch_next_page
        @entries += kampfsport_client.locations(next_page_query_opts).entries
        @attributes['page'] = page + 1
      end
    end
  end
end
