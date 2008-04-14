module Merb
    module BikersHelper
      def total_miles(biker)
        @biker.rides.map {|r| r.distance }.inject { |sum, dist| sum + dist } || 0.0
      end
    end
end