require File.join(File.dirname(__FILE__), "..", 'spec_helper.rb')

describe Merb::RidesHelper do
  it "should take a string and return the current date" do
    1.should == 2
    strtodate("today").should == Date.today.strftime("%Y-%m-%d")
  end
end