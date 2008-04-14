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
  end
end
