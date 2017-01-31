require 'csv'
module Openbeerdb
  module Loader
    class Category
      attr_reader :path

      def initialize(path)
        @path = path
      end

      def import
        ::Category.transaction do
          CSV.foreach(path, headers: true) do |line|
            ::Category.new({ name: line['cat_name'] }).save(validate: false)
          end
        end
      end
    end
  end
end
