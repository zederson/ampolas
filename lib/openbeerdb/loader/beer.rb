require 'csv'

module Openbeerdb
  module Loader
    class Beer
      attr_reader :path

      def initialize(path)
        @path = path
      end

      def import
        ::Beer.transaction do
          CSV.foreach(path, headers: true) do |line|
            values = {
              name:         line['name'],
              abv:          line['abv'],
              ibu:          line['ibu'],
              srm:          line['srm'],
              upc:          line['upc'],
              description:  line['descript']
            }

            values[:brewery_id]  = line['brewery_id'] if line['brewery_id'] != '-1'
            values[:category_id] = line['cat_id'] if line['cat_id'] != '-1'
            values[:style_id]    = line['style_id'] if line['style_id'] != '-1'

            ::Beer.new(values).save(validate: false)
          end
        end
      end
    end
  end
end
