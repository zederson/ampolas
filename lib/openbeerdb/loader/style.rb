require 'csv'
module Openbeerdb
  module Loader
    class Style
      attr_reader :path

      def initialize(path)
        @path = path
      end

      def import
        ::Style.transaction do
          CSV.foreach(path, headers: true) do |line|
            ::Style.new({ name: line['style_name'], category_id: line['cat_id'] }).save(validate: false)
          end
        end
      end
    end
  end
end
