require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Ride do
	
	before :all do
		@biker = Biker.new :first_name => "first", :last_name => "last", :username => "user", :password => "pass"
		@biker.save
	end
	
	def pop_ride
		@ride = Ride.new
		@ride.biker = @biker
	end
	
  it "should not save with incomplete data" do
    ride = Ride.new
		ride.biker = @biker
		lambda {ride.save}.should raise_error
		# ride.biker_id = @biker.id
		# 		lambda {ride.save}.should raise_error
		# 		ride.distance = 10
		# 		lambda {ride.save}.should raise_error
		# 		ride.date = "2008-01-01"
		# 		lambda {ride.save}.should_not raise_error
  end

	after :all do
		Biker.all.each {|b| b.destroy}
	end

end