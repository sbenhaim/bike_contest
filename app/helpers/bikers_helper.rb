module Merb
    module BikersHelper
      def sort_miles(bikers)
        bikers.sort {|a, b| b.total_miles <=> a.total_miles}
      end
    end
end