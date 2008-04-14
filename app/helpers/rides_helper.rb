module Merb
    module RidesHelper
      def strtodate(date_string)
        if date_string =~ /sunday|monday|tuesday|wednesday|thursday|friday|saturday/i
          date_string = "last " + date_string unless date_string =~ /\blast\b/i
        end
        `php -r 'echo date("Y-m-d", strtotime("#{date_string}"));'`
      end
    end
end