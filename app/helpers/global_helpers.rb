module Merb
  module GlobalHelpers
    def remote_link(text, url, update)
      options = {:href => "javascript:;", :part => url, :rel => update, :class => 'remote'}
      tag(:a, text, options)
    end
    
    def remote_form_for(resource, options, &block)
      options[:action] = "javascript:submitRemoteForm(this, '#{options[:action]}')"
      form_for(resource, options, &block)
    end
    
    def pretty_date(date)
      date = Date.parse(date) if date.kind_of? String
      date.strftime("%a, %B %d")
    end
    
      
    def sort_date(rides)
      rides.sort { |a,b| b.date <=> a.date }
    end
    
    def escape(s)
      Merb::Request.escape(s)
    end
    
    def cardinal(num)
      case num
      when 1: '1st'
      when 2: '2nd'
      when 3: '3rd'
      else num.to_s + 'th'
      end
    end
    
    def this_month
      Date.today.strftime("%m")
    end
    
    def months
      this_month = Date.today.strftime("%m")
      ("04"..this_month).to_a.reverse
    end
    
    def month_of(something)
      something.date.match(/^\d{4}-(\d{2})/)[1]
    end
    
    def month_name(month = Date.today.strftime("%m"), short = false)
      if short
        Date::ABBR_MONTHNAMES[month.to_i]
      else
        Date::MONTHNAMES[month.to_i]
      end
    end
  end
end
