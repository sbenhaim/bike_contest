require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')
include Merb::GlobalHelpers

describe Merb::GlobalHelpers do
  it "should provide a numerical representation of the current month" do
    this_month.should == Date.today.strftime('%m')
  end
  
  it "should provide date for 'today'" do
    strtodate( 'today' ).should == Date.today.strftime('%Y-%m-%d')
  end
  
  it "should provide date for 'yesterday'" do
    strtodate( 'yesterday' ).should == (Date.today - 1).strftime('%Y-%m-%d')
  end
  
  it "should provide date for 'last week'" do
    strtodate( 'last week' ).should == (Date.today - 7).strftime('%Y-%m-%d')
  end
  
  it "should provide today's date on failure to parse" do
    strtodate( 'elephant' ).should == Date.today.strftime('%Y-%m-%d')
  end
  
  it "should should provide date for '2 days ago'" do
    strtodate( '2 days ago' ).should == (Date.today - 2).strftime('%Y-%m-%d')
  end
  
  it "should provide date for 'wed' of last week" do
    strtodate( 'wed' ).should == (Date.parse('wed') - 7).strftime('%Y-%m-%d')
  end
end