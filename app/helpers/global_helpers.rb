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
      date.strftime("%b %d, %Y")
    end
    
      
    def sort_date(rides)
      rides.sort { |a,b| b.date <=> a.date }
    end
    
    def escape(s)
      Merb::Request.escape(s)
    end
  end
end
