require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Biker do
	before :all do
		biker = Biker.new :first_name => "Mister", :last_name => "Slim", :username => "user", :password => "pass"
		biker.save
	end
	
	def pop_biker
		@biker = Biker.new
		@biker.first_name, @biker.last_name, @biker.username, @biker.password = "first", "last", "user", "pass"
	end

	it "should take a first_name, last_name, username, and password" do
		biker = Biker.new
		biker.first_name = "FN"
		biker.last_name = "LN"
		biker.username = "user"
		biker.password = "pass"
		biker.first_name.should == "FN"
		biker.last_name.should == "LN"
		biker.username.should == "user"
		biker.password.should == "pass"
	end

	it "should not save with missing information" do
		biker = Biker.new
		lambda {biker.save}.should raise_error
		biker.first_name = "first"
		lambda {biker.save}.should raise_error
		biker.last_name = "last"
		lambda {biker.save}.should raise_error
		biker.username = "user"
		lambda {biker.save}.should raise_error
		biker.password = "pass"
		lambda {biker.save}.should_not raise_error
	end

	it "should not allow duplicate usernames" do
		pop_biker
		@biker.username = "user"
		lambda {@biker.save!}.should raise_error
	end

	after :all do
		Biker.all.each { |b| b.destroy }
	end

end