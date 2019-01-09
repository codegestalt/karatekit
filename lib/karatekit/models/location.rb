module Karatekit
  module Models
    class Location < KaratekitRecord
      attributed :id,
                 :archived,
                 :address

      def path
        "locations/#{@attributes['id']}"
      end
    end
  end
end
