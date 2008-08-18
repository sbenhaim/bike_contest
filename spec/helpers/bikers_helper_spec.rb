require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

include Merb::BikersHelper

describe Merb::BikersHelper do
  it "should convert month abbr. to a numerical equavalent or show number for current month" do
    period_to_i( 'apr' ).should == '04'
  end
end