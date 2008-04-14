class Biker < DataMapper::Base
  has_many :rides
  
  property :first_name, :string
  property :last_name, :string
  property :username, :string
  property :password, :string
  property :miles_public, :boolean
  
  def total_miles
    self.rides.map {|r| r.distance }.inject { |sum, dist| sum + dist } || 0.0
  end

end