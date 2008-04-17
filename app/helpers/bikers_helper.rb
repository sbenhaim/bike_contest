module Merb
    module BikersHelper
      def sort_miles(bikers, period = 'month')
        bikers.sort {|a, b| b.miles(period) <=> a.miles(period)}
      end      
    end
end