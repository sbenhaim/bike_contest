class Biker
  include DataMapper::Resource
  
  has n, :rides
  
  property :id, Integer,    :serial => true
  property :first_name, String, :nullable => false
  property :last_name, String, :nullable => false
  property :username, String, :nullable => false
  property :password, String, :nullable => false
  property :miles_public, Boolean
  
  def miles( period )    
    if period == 'total'
      self.rides.map {|r| r.distance }.inject { |sum, dist| sum + dist } || 0.0
    else
      self.rides.map {|r| r.distance if r.date.match(/^\d{4}-(\d{2})/)[1] == period }.compact.inject { |sum, dist| sum + dist } || 0.0
    end
  end
  
  def place(period)
    Biker.all.map {|biker| biker.miles(period)}.sort.reverse.index(self.miles(period)) + 1
  end
  
end