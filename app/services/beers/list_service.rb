module Beers
  class ListService
    def self.list_most_important
      Beer.last(12)
    end
  end
end
