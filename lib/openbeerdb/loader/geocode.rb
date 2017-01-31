require 'csv'
module Openbeerdb
  module Loader
    class Geocode
      attr_reader :path

      def initialize(path)
        @path = path
      end

      def import
        ::BreweryGeocode.transaction do
          CSV.foreach(path, headers: true) do |line|
            values = {
              latitude:    line['latitude'],
              longitude:   line['longitude'],
              accuracy:    line['accuracy'],
              brewery_id:  line['brewery_id']
            }
            ::BreweryGeocode.new(values).save(validate: false)
          end
        end
      end
    end
  end
end

