require 'csv'

module Openbeerdb
  module Loader
    class Beer

      attr_reader :path

      def initialize(@path)
        @path = path
      end

      def load_file(path)
        CSV.foreach(path) do |row|
            puts row.inspect
        end
      end

    end
  end
end
