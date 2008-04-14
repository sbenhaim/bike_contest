require File.join(File.dirname(__FILE__), "..", 'spec_helper.rb')

describe Login, "index action" do
  before(:each) do
    dispatch_to(Login, :index)
  end
end