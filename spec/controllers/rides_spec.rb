require File.join(File.dirname(__FILE__), "..", 'spec_helper.rb')

describe Rides, "index action" do
  before(:each) do
    dispatch_to(Rides, :index)
  end
end