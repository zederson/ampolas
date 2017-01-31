module Openbeerdb
  class LoaderService
    attr_reader :path

    def initialize(path)
      @path = path
    end

    def load_all
      Loader::Category.new(path + 'categories.csv').import
      Loader::Style.new(path + 'styles.csv').import
      Loader::Brewery.new(path + 'breweries.csv').import
      Loader::Geocode.new(path + 'breweries_geocode.csv').import
      Loader::Beer.new(path + 'beers.csv').import
      true
    end
  end
end
