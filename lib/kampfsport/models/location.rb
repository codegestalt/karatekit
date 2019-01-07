module Kampfsport
  module Models
    class Location < KampfsportRecord
      attributed :id,
                 :archived,
                 :address

      def path
        "locations/#{@attributes['id']}"
      end
    end
  end
end
