require 'csv'
module Openbeerdb
  module Loader
    class Brewery
      attr_reader :path

      def initialize(path)
        @path = path
      end

      def import
        ::Brewery.transaction do
          CSV.foreach(path, headers: true) do |line|
            values = {
              name:         line['name'],
              address:      line['address1'],
              complement:   line['address2'],
              city:         line['city'],
              state:        line['state'],
              code:         line['code'],
              country:      line['country'],
              phone:        line['phone'],
              site:         line['website'],
              description:  line['descript']
            }
            ::Brewery.new(values).save
          end
        end
      end
    end
  end
end
