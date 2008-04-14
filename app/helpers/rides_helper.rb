module Merb
    module RidesHelper
      def strtodate(date_string)
        `php -r 'echo date("Y-m-d", strtotime("#{date_string}"));'`
      end
    end
end