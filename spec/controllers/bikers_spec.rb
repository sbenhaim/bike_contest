require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe Bikers, "index action" do
  before(:each) do
    dispatch_to(Bikers, :index)
  end
end