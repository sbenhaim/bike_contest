module Merb
    module BikersHelper
      def sort_miles(bikers, period = 'month')
        bikers.sort {|a, b| b.miles(period) <=> a.miles(period)}
      end      
      
      def period_to_i( period )
        return this_month unless period
        return 'total' if period == 'total'
        months = %w{apr may jun jul aug sep oct}
        period = months.index(period) + 4 if months.include? period
        "0" + period.to_s
      end
    end
end